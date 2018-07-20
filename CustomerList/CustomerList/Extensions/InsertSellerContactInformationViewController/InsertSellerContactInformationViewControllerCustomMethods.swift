//
//  InsertSellerContactInformationViewControllerCustomMethods.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/16/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension InsertSellerContactInformationViewController {
    
    // MARK: Set Delegate For ViewController UIControls
    func setDelegateForTextFields() {
        phoneLineNumberTextField.delegate = self
        firstMobileNumberTextField.delegate = self
        secondMobileNumberTextField.delegate = self
        whatsNumberTestField.delegate = self
        firstEmailAddressTextField.delegate = self
        secondEmailAddressTextField.delegate = self
        firstAddressLineTextField.delegate = self
        secondAddressLineTextField.delegate = self
    }
    
    // MARK: Class's Data Validation and Setup
    func setClassValues() {
        if isAllDataValid() {
            setAllClassData()
        } else if isRequiredDataValid() {
            setRequiredClassData()
        } else {
            showErrorAlertController()
        }
    }
    
    func isAllDataValid() ->Bool {
        if (phoneLineNumberTextField.text != "0" || firstMobileNumberTextField.text != "0" || secondMobileNumberTextField.text != "0" || whatsNumberTestField.text != "0" || firstEmailAddressTextField.text != "" || secondEmailAddressTextField.text != "" || firstAddressLineTextField.text != "" || secondAddressLineTextField.text != "") {
            return true
        } else {
            return false
        }
    }
    
    func isRequiredDataValid() -> Bool {
        if (phoneLineNumberTextField.text != "0" || firstMobileNumberTextField.text != "0" || whatsNumberTestField.text != "0" || firstEmailAddressTextField.text != "" || firstAddressLineTextField.text != "") {
            return true
        } else {
            return true
        }
    }
    
    func showErrorAlertController() {
        let errorAlert: UIAlertController = UIAlertController(title: "خطآ", message: "يبدو انه  هناك خطآ حدث اثناء ادخال البيانات رجائا قم بمراجعة بياناتك ", preferredStyle: .alert)
        
        errorAlert.addAction(UIAlertAction(title: "حسنا", style: .cancel, handler: { (alert) in
            return
        }))
        
        self.present(errorAlert, animated: true, completion: nil)
    }
    
    func setAllClassData() {
        phoneLineNumber = Int32(phoneLineNumberTextField.text!)!
        firstMobileNumber = Int32(firstMobileNumberTextField.text!)!
        secondMobileNumber = Int32(secondMobileNumberTextField.text!)!
        whatsNumber = Int32(whatsNumberTestField.text!)!
        firstEmailAddress = firstEmailAddressTextField.text!
        secondEmailAddress = secondEmailAddressTextField.text!
        firstAddressLine = firstAddressLineTextField.text!
        secondAddressLine = secondAddressLineTextField.text!
        if !(phoneLineNumber > 0) || !(firstMobileNumber > 0) || !(secondMobileNumber > 0) || !(whatsNumber > 0) {
            showErrorAlertController()
        }
    }
    
    func setRequiredClassData() {
        phoneLineNumber = Int32(phoneLineNumberTextField.text!)!
        firstMobileNumber = Int32(firstMobileNumberTextField.text!)!
        secondMobileNumber = 0
        whatsNumber = Int32(whatsNumberTestField.text!)!
        firstEmailAddress = firstEmailAddressTextField.text!
        secondEmailAddress = ""
        firstAddressLine = firstAddressLineTextField.text!
        secondAddressLine = ""
        if !(phoneLineNumber > 0) || !(firstMobileNumber > 0) || !(whatsNumber > 0) {
            showErrorAlertController()
        }
    }
    
    // MARK: Saving Seller Data Operation.
    func showConfirmationAlertController() {
        // Saving Seller Data to CoreData xcmodeldata.
        let confirmationAlert = UIAlertController(title: "Success", message: "انت على وشك آضافة بيانات جديدة هل انت متآكد؟", preferredStyle: .alert)
        
        confirmationAlert.addAction(UIAlertAction(title: "نعم", style: .default, handler: { (alert) in
            self.InitiateSavingSellerDataOperation()
        }))
        
        confirmationAlert.addAction(UIAlertAction(title: "الغاء التنفيد", style: .cancel, handler: { (alert) in
            return
        }))
        
        self.present(confirmationAlert, animated: true, completion: nil)
    }
    
    func InitiateSavingSellerDataOperation() {
        self.saveSeller { (completed) in
            if completed {
                showOperationSuccessAlertController()
            } else {
                showOperationFailureAlertController()
            }
        }
    }
    
    func saveSeller(_ completion: (_ completed: Bool) -> ()) {
        let managedContext: NSManagedObjectContext = (appDelegate?.persistentContainer.viewContext)!
        let seller = Seller(context: managedContext)
        
        seller.sellerName = self.sellerName
        seller.nationality = self.sellerNationalityy
        seller.birthdate = self.birthdayDate.description
        seller.gender = self.sellerGender
        seller.telephoneNumber = self.phoneLineNumber
        seller.mobileNumber1 = self.firstMobileNumber
        seller.mobileNumber2 = self.secondMobileNumber
        seller.watsapNumber1 = self.whatsNumber
        seller.emailAddress1 = self.firstEmailAddress
        seller.emailAddress2 = self.secondEmailAddress
        seller.address1 = self.firstAddressLine
        seller.address2 = self.secondAddressLine
        
        do {
            try managedContext.save()
            completion(true)
        } catch {
            print ("Couldn't Save data. \(error.localizedDescription)")
            completion(false)
        }
    }
    
    func showOperationSuccessAlertController() {
        let successAlert = UIAlertController(title: "نجاح العملية", message: "تم ادخال البيانات بنجاح", preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "حسنا", style: .default, handler: { (action) in
            self.moveBackToMainScene()
        }))
        self.present(successAlert, animated: true, completion: nil)
    }
    
    func moveBackToMainScene() {
        let InsertSellerPersonalInformationVC: InsertSellerPersonalInformationViewController = self.storyboard?.instantiateViewController(withIdentifier: "InsertSellerPersonalInformationViewController") as! InsertSellerPersonalInformationViewController
        self.present(InsertSellerPersonalInformationVC, animated: false, completion: nil)
        InsertSellerPersonalInformationVC.dismiss(animated: true, completion: nil)
    }
    
    func showOperationFailureAlertController() {
        let failureAlert = UIAlertController(title: "فشل العملية", message: "فشل اثناء التنفيذ", preferredStyle: .alert)
        failureAlert.addAction(UIAlertAction(title: "حسنا", style: .default, handler: { (alert) in
            return
        }))
        self.present(failureAlert, animated: true, completion: nil)
    }
    
    func confirmSavingSellerDataOperation() {
        showConfirmationAlertController()
    }
}
