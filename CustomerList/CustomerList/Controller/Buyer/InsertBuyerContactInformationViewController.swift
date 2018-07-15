//
//  InsertBuyerContactInformationViewController.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/4/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class InsertBuyerContactInformationViewController: UIViewController {
    
    var buyerName: String = ""
    var buyerNationality: String = ""
    var birthdate: String = ""
    var gender: String = ""
    var numberOfFamilyMembers: Int32 = 0
    var numberOfKids: Int32 = 0
    var maritalStatus: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func showMeSomeDataButtonPressed(_ sender: Any) {
        print(" Name: \(self.buyerName) \n Naionality: \(self.buyerNationality) \n Birthdate: \(self.birthdate) \n Gender: \(self.gender) \n Marital Status: \(self.maritalStatus) \n Number Of Family Members: \(self.numberOfFamilyMembers) \n Numer Of Kids: \(self.numberOfKids)")
    }
    
}
