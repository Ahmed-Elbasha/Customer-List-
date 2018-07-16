//
//  InsertBuyerMaritalAndFamilyInformationViewController.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/4/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class InsertBuyerMaritalAndFamilyInformationViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var numberOfFamilyMembersTextField: UITextField!
    @IBOutlet weak var numberOfKidsTextField: UITextField!
    @IBOutlet weak var maritalStatusPickerView: UIPickerView!
    
    // MARK: Class Attributes
    var buyerName: String = ""
    var buyerNationality: String = ""
    var birthdate: String = ""
    var gender: String = ""
    var numberOfFamilyMembers: Int32 = 0
    var numberOfKids: Int32 = 0
    var maritalStatus: String = ""
    
    var maritalStatusArray = ["مطلق", "ارمل", "اعزب", "متزوج"]

    // MARK: Class Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        maritalStatusPickerView.delegate = self
        maritalStatusPickerView.dataSource = self
        numberOfKidsTextField.delegate = self
        numberOfKidsTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: View Controller Received Data Setup
    func initWithData(name: String, nationality: String, birthdate: String, gender: String) {
        self.buyerName = name
        self.buyerNationality = nationality
        self.birthdate = birthdate
        self.gender = gender
    }

    // MARK: IBActions
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        setClassData()
        if isDataValid() {
            performSegue(withIdentifier: "MoveToInsertBuyerContactInformationViewController", sender: Any?.self)
        } else {
            showErrorAlertController()
        }
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MoveToInsertBuyerContactInformationViewController"{
            let insertBuyerContactInformationVC = segue.destination as! InsertBuyerContactInformationViewController
            insertBuyerContactInformationVC.initWithData(name: self.buyerName, nationality: self.buyerNationality, birthdate: self.birthdate, gender: self.gender, numberOfFamilyMembers: self.numberOfFamilyMembers, numberOfKids: self.numberOfKids, maritalStatus: self.maritalStatus)
        }
    }
    
}
