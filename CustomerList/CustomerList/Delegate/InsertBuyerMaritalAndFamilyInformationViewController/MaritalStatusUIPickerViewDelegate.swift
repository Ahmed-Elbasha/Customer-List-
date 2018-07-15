//
//  MaritalStatusUIPickerViewDelegate.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/14/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import Foundation
import UIKit

extension InsertBuyerMaritalAndFamilyInformationViewController: UIPickerViewDelegate,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return maritalStatusArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return maritalStatusArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        maritalStatus = maritalStatusArray[pickerView.selectedRow(inComponent: 0)]
    }
}
