//
//  InsertSellerPersonalInformationViewControllerCustomMehods.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/16/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import Foundation
import UIKit

extension InsertSellerPersonalInformationViewController {
    
    // MARK: Gender Buttons Setup
    func makeFemaleSelected() {
        femaleButton.backgroundColor = magenta
        makeMaleNotSelected()
    }
    
    func makeMaleNotSelected() {
        maleButton.backgroundColor = lightCyan
    }
    
    func makeMaleSelected() {
        maleButton.backgroundColor = cyan
        makeFemaleNotSelected()
    }
    
    func makeFemaleNotSelected() {
        femaleButton.backgroundColor = lightMagenta
    }
    
    // MARK: Class's Data Validation and Setup
    func isDataValid() -> Bool {
        if sellerNameTextField.text != "" && nationalityTextField.text != ""  {
            return true
        } else {
            return false
        }
    }

    func setClassValues() {
        sellerName = sellerNameTextField.text!
        sellerNationality = nationalityTextField.text!
        
        if maleButton.backgroundColor == cyan {
            genderInString = Gender.male.rawValue
        } else if femaleButton.backgroundColor == magenta {
            genderInString = Gender.female.rawValue
        }
        birthdayDate = birthDayDatePicker.description
    }
    
    func validateClassDataSet() {
        if isDataValid() {
            setClassValues()
        } else {
            showErrorAlertController()
        }
    }
    
    func showErrorAlertController() {
        let alert: UIAlertController = UIAlertController(title: "خطآ", message: "يبدو انه  هناك خطآ حدث اثناء ادخال البيانات رجائا قم بمراجعة بياناتك ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "حسنا", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
