//
//  InsertBuyerContactInformationViewControllerCustomMethods.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/16/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension InsertBuyerContactInformationViewController {
    
    // MARK: Data Set Validation Check
    func isAllDataValid() -> Bool {
        if phoneLineNumberTextField.text != "0" && firstMobileNumberTextField.text != "0" && secondMobileNumberTextField.text != "0" && whatsappNumberTextField.text != "0" && firstEmailAddressTextField.text != "" && secondEmailAddressTextField.text != "" && firstAddressLineTextField.text != "" && secondAddressLineTextField.text != "" {
            return true
        } else {
            return false
        }
    }
    
    func setAllClassData() {
        phoneLineNumber = Int32(phoneLineNumberTextField.text!)!
        firstMobileNumber = Int32(firstMobileNumberTextField.text!)!
        secondMobileNumber = Int32(secondMobileNumberTextField.text!)!
        whatsappNumber = Int32(whatsappNumberTextField.text!)!
        firstEmailAddress = firstEmailAddressTextField.text!
        secondEmailAddress = secondEmailAddressTextField.text!
        firstAddressLine = firstAddressLineTextField.text!
        secondAddressLine = secondAddressLineTextField.text!
        if !(phoneLineNumber > 0) || !(firstMobileNumber > 0) || !(secondMobileNumber > 0) || !(whatsappNumber > 0) {
            showErrorAlertController()
        }
    }
    
    func isRequiredDataIsValid() -> Bool {
        if phoneLineNumberTextField.text != "0" && firstMobileNumberTextField.text != "0" && whatsappNumberTextField.text != "0" && firstEmailAddressTextField.text != "" && firstAddressLineTextField.text != "" {
            return true
        } else {
            return false
        }
    }
    
    func setRequiredClassData() {
        phoneLineNumber = Int32(phoneLineNumberTextField.text!)!
        firstMobileNumber = Int32(firstMobileNumberTextField.text!)!
        secondMobileNumber = 0
        whatsappNumber = Int32(whatsappNumberTextField.text!)!
        firstEmailAddress = firstEmailAddressTextField.text!
        secondEmailAddress = ""
        firstAddressLine = firstAddressLineTextField.text!
        secondAddressLine = ""
        if !(phoneLineNumber > 0) || !(firstMobileNumber > 0) || !(whatsappNumber > 0) {
            showErrorAlertController()
        }
    }
    
    func checkTheValidationOfData() {
        if isAllDataValid() {
            setAllClassData()
        } else if isRequiredDataIsValid() {
            setRequiredClassData()
        } else {
            showErrorAlertController()
        }
    }
    
    func showErrorAlertController() {
        let errorAlert: UIAlertController = UIAlertController(title: "خطآ", message: "يبدو انه  هناك خطآ حدث اثناء ادخال البيانات رجائا قم بمراجعة بياناتك ", preferredStyle: .alert)
        
        errorAlert.addAction(UIAlertAction(title: "حسنا", style: .cancel, handler: { (alert) in
            return
        }))
        
        self.present(errorAlert, animated: true, completion: nil)
    }
    
    // MARK: Perform Save Buyer Data Operation.
    func confiremTheInitiationOfSavingBuyerDataOperation() {
        showConfirmationAlertController()
    }
    
    func initiateSavingBuyerDataOperation() {
        saveBuyerData { (completed) in
            if completed {
                self.showOperationSuccessAlertController()
            } else {
                self.showOperationFailureAlertController()
            }
        }
    }
    
    func showOperationSuccessAlertController() {
        let successAlert = UIAlertController(title: "نجاح العملية", message: "تم ادخال البيانات بنجاح", preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "حسنا", style: .default, handler: { (action) in
            self.moveBackToMainScene()
        }))
        self.present(successAlert, animated: true, completion: nil)
    }
    
    func showOperationFailureAlertController() {
        let failureAlert = UIAlertController(title: "فشل العملية", message: "فشل اثناء التنفيذ", preferredStyle: .alert)
        failureAlert.addAction(UIAlertAction(title: "حسنا", style: .default, handler: { (alert) in
            return
        }))
        self.present(failureAlert, animated: true, completion: nil)
    }
    
    func moveBackToMainScene() {
        let insertBuyerPersonalInformationViewController = storyboard?.instantiateViewController(withIdentifier: "InsertBuyerContactInformationViewController") as! InsertBuyerContactInformationViewController
        self.present(insertBuyerPersonalInformationViewController, animated: true, completion: nil)
        insertBuyerPersonalInformationViewController.dismiss(animated: true, completion: nil)
    }
    
    func saveBuyerData(completion: (_ completed: Bool) -> () ) {
        let managedContext = appDelegate.persistentContainer.viewContext
        let buyer = NSEntityDescription.entity(forEntityName: "Buyer", in: managedContext)
        let newBuyer = NSManagedObject(entity: buyer!, insertInto: managedContext)
        
        newBuyer.setValue(self.buyerName, forKey: "buyerName")
        newBuyer.setValue(self.buyerNationality, forKey: "nationality")
        newBuyer.setValue(<#T##value: Any?##Any?#>, forKey: <#T##String#>)
        buyer.birthdate = self.birthdate
        buyer.gender = self.gender
        buyer.familyMembers = self.numberOfFamilyMembers
        buyer.numberOfKids = self.numberOfKids
        buyer.maritalStatus = self.maritalStatus
        buyer.telephoneNumber = self.phoneLineNumber
        buyer.mobileNumber1 = self.firstMobileNumber
        buyer.mobileNumber2 = self.secondMobileNumber
        buyer.watsapNumber1 = self.whatsappNumber
        buyer.emailAddress1 = self.firstEmailAddress
        buyer.emailAddress2 = self.secondEmailAddress
        buyer.address1 = self.firstAddressLine
        buyer.address2 = self.secondAddressLine
        
        do {
            try managedContext.save()
            print("Data Saved Successfully.")
            completion(true)
        } catch {
            print("Data Saving Operation Failed \(error.localizedDescription)")
            completion(false)
        }
    }
    
    func showConfirmationAlertController() {
        // Saving Seller Data to CoreData xcmodeldata.
        let confirmationAlert = UIAlertController(title: "Success", message: "انت على وشك آضافة بيانات جديدة هل انت متآكد؟", preferredStyle: .alert)
        
        confirmationAlert.addAction(UIAlertAction(title: "نعم", style: .default, handler: { (alert) in
            self.initiateSavingBuyerDataOperation()
        }))
        
        confirmationAlert.addAction(UIAlertAction(title: "الغاء التنفيد", style: .cancel, handler: { (alert) in
            return
        }))
        
        self.present(confirmationAlert, animated: true, completion: nil)
    }
    
    // MARK: Set Delegate For ViewController UIControls
    func setDelegateForUIControls() {
        phoneLineNumberTextField.delegate = self
        firstMobileNumberTextField.delegate = self
        secondMobileNumberTextField.delegate = self
        whatsappNumberTextField.delegate = self
        firstEmailAddressTextField.delegate = self
        secondEmailAddressTextField.delegate = self
        firstAddressLineTextField.delegate = self
        secondAddressLineTextField.delegate = self
    }
}
