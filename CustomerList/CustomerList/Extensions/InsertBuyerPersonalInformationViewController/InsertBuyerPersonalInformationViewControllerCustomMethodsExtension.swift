//
//  CustomMethodsExtension.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/15/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import Foundation
import UIKit

extension InsertBuyerPersonalInformationViewController {
    // MARK: Gender Buttons Setup
    func makeMaleButtonSelected() {
        maleButton.backgroundColor = cyan
        makeFemaleButtonNotSelected()
    }
    
    func makeMaleButtonNotSelected() {
        maleButton.backgroundColor = lightCyan
    }
    
    func makeFemaleButtonSelected() {
        femaleButton.backgroundColor = magenta
        makeMaleButtonNotSelected()
    }
    
    func makeFemaleButtonNotSelected() {
        femaleButton.backgroundColor = lightMagenta
    }
    
    func setGenderInStringValue() {
        if maleButton.backgroundColor == cyan {
            genderInString = Gender.male.rawValue
        }
        
        if femaleButton.backgroundColor == magenta {
            genderInString = Gender.female.rawValue
        }
    }
    
    // MARK: Class's Data Validation and Setup
    func isDataValid() -> Bool {
        if buyerName != "" && nationality != "" && birthDate == birthDateDatePicker.date.description {
            return true
        } else {
            return false
        }
    }
    
    func setClassData() {
        buyerName = buyerNameTextField.text!
        nationality = buyerNationalityTextField.text!
        setGenderInStringValue()
        birthDate = birthDateDatePicker.date.description
    }
    
    func showErrorAlertController() {
        let alert: UIAlertController = UIAlertController(title: "خطآ", message: "يبدو انه  هناك خطآ حدث اثناء ادخال البيانات رجائا قم بمراجعة بياناتك ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "حسنا", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
