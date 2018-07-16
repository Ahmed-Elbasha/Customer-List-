//
//  InsertBuyerContactInformationViewController.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/4/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit
import CoreData

class InsertBuyerContactInformationViewController: UIViewController {
    
    @IBOutlet weak var phoneLineNumberTextField: UITextField!
    @IBOutlet weak var firstMobileNumberTextField: UITextField!
    @IBOutlet weak var secondMobileNumberTextField: UITextField!
    @IBOutlet weak var whatsappNumberTextField: UITextField!
    @IBOutlet weak var firstEmailAddressTextField: UITextField!
    @IBOutlet weak var secondEmailAddressTextField: UITextField!
    @IBOutlet weak var firstAddressLineTextField: UITextField!
    @IBOutlet weak var secondAddressLineTextField: UITextField!
    
    var phoneLineNumber: Int32 = 0
    var firstMobileNumber: Int32 = 0
    var secondMobileNumber: Int32 = 0
    var whatsappNumber: Int32 = 0
    var firstEmailAddress: String = ""
    var secondEmailAddress: String = ""
    var firstAddressLine: String = ""
    var secondAddressLine: String = ""
    var buyerName: String = ""
    var buyerNationality: String = ""
    var birthdate: String = ""
    var gender: String = ""
    var numberOfFamilyMembers: Int32 = 0
    var numberOfKids: Int32 = 0
    var maritalStatus: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegateForUIControls()
    }
    
    func initWithData(name: String, nationality: String, birthdate: String, gender: String, numberOfFamilyMembers: Int32, numberOfKids: Int32, maritalStatus: String) {
        self.buyerName = name
        self.buyerNationality = nationality
        self.birthdate = birthdate
        self.gender = gender
        self.numberOfFamilyMembers = numberOfFamilyMembers
        self.numberOfKids = numberOfKids
        self.maritalStatus = maritalStatus
    }
    
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
        let managedContext: NSManagedObjectContext? =  appDelegate.persistentContainer.viewContext
        let buyer = Buyer(context: managedContext!)
        
        buyerName = buyer.buyerName!
        buyerNationality = buyer.nationality!
        birthdate = buyer.birthdate!
        gender = buyer.gender!
        numberOfFamilyMembers = buyer.familyMembers
        numberOfKids = buyer.numberOfKids
        maritalStatus = buyer.maritalStatus!
        phoneLineNumber = buyer.telephoneNumber
        firstMobileNumber = buyer.mobileNumber1
        secondMobileNumber = buyer.mobileNumber2
        whatsappNumber = buyer.watsapNumber1
        firstEmailAddress = buyer.emailAddress1!
        secondEmailAddress = buyer.emailAddress2!
        firstAddressLine = buyer.address1!
        secondAddressLine = buyer.address2!
        
        do {
            try managedContext?.save()
            print("Data Saved Successfully.")
            completion(true)
        } catch {
            print("Data Saving Operation Failed" + error.localizedDescription)
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
    
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func addBuyerButtonpressed(_ sender: Any) {
        checkTheValidationOfData()
        confiremTheInitiationOfSavingBuyerDataOperation()
    }
    
}
