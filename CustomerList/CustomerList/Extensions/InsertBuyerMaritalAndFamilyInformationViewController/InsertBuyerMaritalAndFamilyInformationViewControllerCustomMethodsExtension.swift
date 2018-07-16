//
//  CustomMethodsExtension.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/15/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import Foundation
import UIKit

extension InsertBuyerMaritalAndFamilyInformationViewController {
    func setClassData() {
        numberOfFamilyMembers = Int32(numberOfFamilyMembersTextField.text!)!
        numberOfKids = Int32(numberOfKidsTextField.text!)!
    }
    
    func isDataValid() -> Bool {
        if buyerName != "" && buyerNationality != "" && birthdate != "" && gender != "" && numberOfFamilyMembers >= 0 && numberOfKids >= 0 && maritalStatus != "" {
            return true
        } else {
            return false
        }
    }
    
    func showErrorAlertController() {
        let alert: UIAlertController = UIAlertController(title: "خطآ", message: "يبدو انه  هناك خطآ حدث اثناء ادخال البيانات رجائا قم بمراجعة بياناتك ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "حسنا", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
