//
//  InsertSellerContactInformationViewController.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/4/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class InsertSellerContactInformationViewController: UIViewController {
    
    // MARK: IBOutlets.
    @IBOutlet weak var phoneLineNumberTextField: UITextField!
    @IBOutlet weak var firstMobileNumberTextField: UITextField!
    @IBOutlet weak var secondMobileNumberTextField: UITextField!
    @IBOutlet weak var whatsNumberTestField: UITextField!
    @IBOutlet weak var firstEmailAddressTextField: UITextField!
    @IBOutlet weak var secondEmailAddressTextField: UITextField!
    @IBOutlet weak var firstAddressLineTextField: UITextField!
    @IBOutlet weak var secondAddressLineTextField: UITextField!
    
    // MARK: Class's Attributes
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
    
    // MARK: View Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDelegateForTextFields()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        phoneLineNumberTextField.text = "0"
        firstMobileNumberTextField.text = "0"
        secondMobileNumberTextField.text = "0"
        whatsNumberTestField.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: View Controller's Received Data Setup
    func initData(sellerName: String, sellerNationality: String, birthdayDate: String, gender: String) {
        self.sellerName = sellerName
        self.sellerNationalityy = sellerNationality
        self.sellerGender = gender
        self.birthdayDate = birthdayDate
    }
    
    // MARK: IBActions
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createSellerWasPressed(_ sender: Any) {
        self.setClassValues()
        self.showConfirmationAlertController()
    }
}
