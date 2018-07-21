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
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    // MARK: IBOutlets
    @IBOutlet weak var phoneLineNumberTextField: UITextField!
    @IBOutlet weak var firstMobileNumberTextField: UITextField!
    @IBOutlet weak var secondMobileNumberTextField: UITextField!
    @IBOutlet weak var whatsappNumberTextField: UITextField!
    @IBOutlet weak var firstEmailAddressTextField: UITextField!
    @IBOutlet weak var secondEmailAddressTextField: UITextField!
    @IBOutlet weak var firstAddressLineTextField: UITextField!
    @IBOutlet weak var secondAddressLineTextField: UITextField!
    
    // MARK: Class's Attributes
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

    // MARK: Application Life Cycle Methods.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDelegateForUIControls()
    }
    
    // MARK: ViewController's Received Data Setup
    func initWithData(name: String, nationality: String, birthdate: String, gender: String, numberOfFamilyMembers: Int32, numberOfKids: Int32, maritalStatus: String) {
        self.buyerName = name
        self.buyerNationality = nationality
        self.birthdate = birthdate
        self.gender = gender
        self.numberOfFamilyMembers = numberOfFamilyMembers
        self.numberOfKids = numberOfKids
        self.maritalStatus = maritalStatus
    }
    
    // MARK: IBActions
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addBuyerButtonpressed(_ sender: Any) {
        self.checkTheValidationOfData()
        self.confiremTheInitiationOfSavingBuyerDataOperation()
    }
    
}
