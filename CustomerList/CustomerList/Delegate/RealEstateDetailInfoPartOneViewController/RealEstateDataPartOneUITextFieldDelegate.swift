//
//  RealEstateDataPartOneUITextFieldDelegate.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/16/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import Foundation
import UIKit

extension RealEstateDetailInfoPartOneViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let textFieldTag = textField.tag
        if textFieldTag == 2 || textFieldTag == 3 || textFieldTag == 4 || textFieldTag == 5 || textFieldTag == 7 || textFieldTag == 8 {
            if textField.text == "" {
                textField.text = "0"
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let textFieldTag = textField.tag
        if textFieldTag == 2 || textFieldTag == 3 || textFieldTag == 4 || textFieldTag == 5 || textFieldTag == 7 || textFieldTag == 8 {
            if textField.text == "" {
                textField.text = "0"
            }
        }
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.clearButtonMode = .whileEditing
        return (textField.text != "")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
