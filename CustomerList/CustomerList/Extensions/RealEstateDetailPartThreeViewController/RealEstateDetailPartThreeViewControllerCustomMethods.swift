//
//  RealEstateDetailPartThreeViewControllerCustomMethods.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/19/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import Foundation
import UIKit

extension RealEstateDetailPartThreeViewController {
    
    // MARK: Set Delegate For ViewController UIControls
    func setDelegateForUIControls() {
        contractTypePickerView.delegate = self
        unitTypePickerView.delegate = self
        finishingTypePickerView.delegate = self
    }
    
    // MARK: Set Data Source For ViewController UIControls
    func setDataSourceForUIControls() {
        contractTypePickerView.dataSource = self
        unitTypePickerView.dataSource = self
        finishingTypePickerView.dataSource = self
    }
    
    // MARK: Performing Segue
    func moveToNextViewController() {
        performSegue(withIdentifier: "MoveToRealEstateDetailPartFourViewController", sender: self)
    }
}
