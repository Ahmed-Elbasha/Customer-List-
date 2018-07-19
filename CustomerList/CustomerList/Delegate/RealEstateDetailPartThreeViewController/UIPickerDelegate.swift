//
//  ContractTypePickerDelegate.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/19/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import Foundation
import UIKit

extension RealEstateDetailPartThreeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let pickerViewTag = pickerView.tag
        switch pickerViewTag {
        case 0:
            return contractType.count
        case 1:
            return unitType.count
        case 2:
            return finishingType.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let pickerViewTag = pickerView.tag
        switch pickerViewTag {
        case 0:
            selectedContractType = contractType[pickerView.selectedRow(inComponent: 0)]
            break
        case 1:
            selectedUnitType = unitType[pickerView.selectedRow(inComponent: 0)]
            break
        case 2:
            selectedFinishingType = finishingType[pickerView.selectedRow(inComponent: 0)]
            break
        default:
            break
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let pickerViewTag = pickerView.tag
        switch pickerViewTag {
        case 0:
            return contractType[row]
        case 1:
            return unitType[row]
        case 2:
            return finishingType[row]
        default:
            return ""
        }
    }
}
