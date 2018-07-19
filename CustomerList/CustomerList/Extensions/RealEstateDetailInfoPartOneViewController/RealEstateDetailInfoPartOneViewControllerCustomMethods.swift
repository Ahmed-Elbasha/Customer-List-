//
//  RealEstateDetailInfoPartOneViewControllerCustomMethods.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/16/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import Foundation
import UIKit

extension RealEstateDetailInfoPartOneViewController {
    
    // MARK: Set Delegation For UIControls
    func setDelegateForUIControls() {
        areaNameTextField.delegate = self
        compoundNameTextField.delegate = self
        stageNumberTextField.delegate = self
        floorNumberTextField.delegate = self
        buildingNumberTextField.delegate = self
        unitNumberTextField.delegate = self
        viewTextField.delegate = self
        numberOfElevatorsTextField.delegate = self
        numberOfBalconiesTextField.delegate = self
    }
    
    // MARK: Validation Of Class Data Set.
    func isAllDataValid() -> Bool {
        if areaNameTextField.text != "" && compoundNameTextField.text != "" && stageNumberTextField.text != "0" && floorNumberTextField.text != "0" && buildingNumberTextField.text != "0" && unitNumberTextField.text != "0" && viewTextField.text != "" && numberOfElevatorsTextField.text != "0" && numberOfBalconiesTextField.text != "0" {
            return true
        } else {
            return false
        }
    }
    
    func setAllClassData() {
        areaName = areaNameTextField.text!
        compoundName = compoundNameTextField.text!
        stageNumber = Int32(stageNumberTextField.text!)!
        floorNumber = Int32(floorNumberTextField.text!)!
        buildingNumber = Int32(buildingNumberTextField.text!)!
        unitNumber = Int32(unitNumberTextField.text!)!
        unitView = viewTextField.text!
        numberOfElevators = Int32(numberOfElevatorsTextField.text!)!
        numberOfBalconies = Int32(numberOfBalconiesTextField.text!)!
        if !(stageNumber > 0) || !(floorNumber > 0) || !(buildingNumber > 0) || !(unitNumber > 0) {
            showErrorAlertController()
        }
    }
    
    func showErrorAlertController() {
        let errorAlert: UIAlertController = UIAlertController(title: "خطآ", message: "يبدو انه  هناك خطآ حدث اثناء ادخال البيانات رجائا قم بمراجعة بياناتك ", preferredStyle: .alert)
        
        errorAlert.addAction(UIAlertAction(title: "حسنا", style: .cancel, handler: { (alert) in
            return
        }))
        
        self.present(errorAlert, animated: true, completion: nil)
    }
    
    func validateClassDataSet() {
        if (isAllDataValid()) {
            setAllClassData()
        } else {
            showErrorAlertController()
        }
    }
    
    // MARK: Performing Segue
    func moveTiNextViewController() {
        performSegue(withIdentifier: "MoveToRealEstateDetailPartTwoViewController", sender: self)
    }
}
