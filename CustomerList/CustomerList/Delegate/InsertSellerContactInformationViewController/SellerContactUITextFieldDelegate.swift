//
//  SellerContactUITextFieldDelegate.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/16/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import Foundation
import UIKit

extension InsertSellerContactInformationViewController: UITextFieldDelegate {
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
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textfieldTag = textField.tag
        
        if textfieldTag == 0 || textfieldTag == 1 || textfieldTag == 2 || textfieldTag == 3 {
            if textField.text == "" {
                textField.text = "0"
            }
        }
        return true
    }
}
