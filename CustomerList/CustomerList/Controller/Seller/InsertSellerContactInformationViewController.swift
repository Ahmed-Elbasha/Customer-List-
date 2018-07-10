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
    var birthdayDate: Date = Date()
    var sellerGender: String = ""
    var phoneLineNumber: Int32 = 0
    var firstMobileNumber: Int32 = 0
    var secondMobileNumber: Int32 = 0
    var whatsNumber: Int32 = 0
    var firstEmailAddress: String = ""
    var secondEmailAddress: String = ""
    var firstAddressLine: String = ""
    var secondAddressLine: String = ""
    var textfieldTag: Int32 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDelegateForTextFields()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initData(sellerName: String, sellerNationality: String, birthdayDate: Date, gender: String) {
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

    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createSellerWasPressed(_ sender: Any) {
        if isDataValid() {
            // Saving Seller Data to CoreData xcmodeldata.
            let confirmationAlert = UIAlertController(title: "Success", message: "انت على وشك آضافة بيانات جديدة هل انت متآكد؟", preferredStyle: .alert)
            
            confirmationAlert.addAction(UIAlertAction(title: "نعم", style: .default, handler: { (alert) in
                self.saveSeller { (completed) in
                    
                    if completed {
                        
                        let successAlert = UIAlertController(title: "نجاح العملية", message: "تم ادخال البيانات بنجاح", preferredStyle: .alert)
                        successAlert.addAction(UIAlertAction(title: "حسنا", style: .default, handler: { (action) in
                            let sellerViewController: SellerViewController = self.storyboard?.instantiateViewController(withIdentifier: "SellerViewController") as! SellerViewController
                            self.dismiss(animated: true, completion: nil)
                            self.present(sellerViewController, animated: true, completion: nil)
                        }))
                        self.present(successAlert, animated: true, completion: nil)
                        
                    } else {
                        let failureAlert = UIAlertController(title: "فشل العملية", message: "فشل اثناء التنفيذ", preferredStyle: .alert)
                        failureAlert.addAction(UIAlertAction(title: "حسنا", style: .default, handler: { (alert) in
                            return
                        }))
                        self.present(failureAlert, animated: true, completion: nil)
                    }
                }
            }))
            
            confirmationAlert.addAction(UIAlertAction(title: "الغاء التنفيد", style: .cancel, handler: { (alert) in
                return
            }))
            
            self.present(confirmationAlert, animated: true, completion: nil)
            
        } else {
            let errorAlert: UIAlertController = UIAlertController(title: "خطآ", message: "يبدو انه  هناك خطآ حدث اثناء ادخال البيانات رجائا قم بمراجعة بياناتك ", preferredStyle: .alert)
            errorAlert.addAction(UIAlertAction(title: "حسنا", style: .cancel, handler: { (alert) in
                return
            }))
            self.present(errorAlert, animated: true, completion: nil)
        }
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.clearButtonMode = .whileEditing
        return ((textField.text != "") || (!(textField.text?.isEmpty)!))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            if textField.text != "" || textField.text?.isEmpty != true {
                phoneLineNumber = Int32(phoneLineNumberTextField.text!)!
            }
            break
        case 1:
            if textField.text != "" || textField.text?.isEmpty != true {
                firstMobileNumber = Int32(firstMobileNumberTextField.text!)!
            }
            break
        case 2:
            if textField.text != "" || textField.text?.isEmpty != true {
                secondMobileNumber = Int32(secondMobileNumberTextField.text!)!
            }
            break
        case 3:
            if textField.text != "" || textField.text?.isEmpty != true {
                whatsNumber = Int32(whatsNumberTestField.text!)!
            }
            break
        case 4:
            if textField.text != "" || textField.text?.isEmpty != true {
                firstEmailAddress = firstEmailAddressTextField.text!
            }
            break
        case 5:
            if textField.text != "" || textField.text?.isEmpty != true {
                secondEmailAddress = secondEmailAddressTextField.text!
            }
            break
        case 6:
            if textField.text != "" || textField.text?.isEmpty != true {
                firstAddressLine = firstAddressLineTextField.text!
            }
            break
        case 7:
            if textField.text != "" || textField.text?.isEmpty != true {
                secondAddressLine = secondAddressLineTextField.text!
            }
            break
        default:
            break
        }
        textField.resignFirstResponder()
    }
    
    func isDataValid() ->Bool {
        if (phoneLineNumber == 0 || firstMobileNumber == 0 || secondMobileNumber == 0 || whatsNumber == 0 || firstEmailAddress == "" || secondEmailAddress == "" || firstAddressLine == "" || secondAddressLine == "") {
            return false
        } else {
            return true
        }
    }
    
    func saveSeller(_ completion: (_ completed: Bool) -> ()) {
        guard let managedContext: NSManagedObjectContext? = appDelegate.persistentContainer.viewContext else {return}
        let seller = Seller(context: managedContext!)
        
        seller.sellerName = self.sellerName
        seller.nationality = self.sellerNationalityy
        seller.birthdate = self.birthdayDate
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
    
}
