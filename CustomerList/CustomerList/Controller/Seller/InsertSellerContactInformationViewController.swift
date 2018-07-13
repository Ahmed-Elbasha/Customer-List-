//
//  InsertSellerContactInformationViewController.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/4/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate

class InsertSellerContactInformationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var phoneLineNumberTextField: UITextField!
    @IBOutlet weak var firstMobileNumberTextField: UITextField!
    @IBOutlet weak var secondMobileNumberTextField: UITextField!
    @IBOutlet weak var whatsNumberTestField: UITextField!
    @IBOutlet weak var firstEmailAddressTextField: UITextField!
    @IBOutlet weak var secondEmailAddressTextField: UITextField!
    @IBOutlet weak var firstAddressLineTextField: UITextField!
    @IBOutlet weak var secondAddressLineTextField: UITextField!
    
    var sellerName: String = ""
    var sellerNationalityy = ""
    var birthdayDate: String = ""
    var sellerGender: String = ""
    var phoneLineNumber: Int32 = 0
    var firstMobileNumber: Int32 = 0
    var secondMobileNumber: Int32 = 0
    var whatsNumber: Int32 = 0
    var firstEmailAddress: String = ""
    var secondEmailAddress: String = ""
    var firstAddressLine: String = ""
    var secondAddressLine: String = ""
    var textfieldTag: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDelegateForTextFields()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initData(sellerName: String, sellerNationality: String, birthdayDate: String, gender: String) {
        self.sellerName = sellerName
        self.sellerNationalityy = sellerNationality
        self.sellerGender = gender
        self.birthdayDate = birthdayDate
    }

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
    }
    
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
        let managedContext: NSManagedObjectContext? = appDelegate.persistentContainer.viewContext
        let seller = Seller(context: managedContext!)
        
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
            try managedContext?.save()
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
    
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createSellerWasPressed(_ sender: Any) {
        setClassValues()
        showConfirmationAlertController()
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.clearButtonMode = .whileEditing
        return (textField.text != "")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textfieldTag = textField.tag
        
        if textfieldTag == 0 || textfieldTag == 1 || textfieldTag == 2 || textfieldTag == 3 {
            if textField.text == "" {
                textField.text = "0"
            }
        }
    }
    
}
