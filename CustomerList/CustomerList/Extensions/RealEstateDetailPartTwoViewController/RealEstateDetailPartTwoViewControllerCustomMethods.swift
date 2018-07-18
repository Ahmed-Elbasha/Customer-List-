//
//  RealEstateDetailPartTwoViewControllerCustomMethods.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/18/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import Foundation
import UIKit

extension RealEstateDetailPartTwoViewController {
    
    // MARK: Set Delegate For ViewController UIControls
    func setDelegateForUIControls() {
        numberOfRoomsTextField.delegate = self
        numberOfMasterRoomsTextField.delegate = self
        numberOfDressingRoomsTextField.delegate = self
        numberOfBathRoomsTextField.delegate = self
        numberOfPiecesOfReceptionTextField.delegate = self
        landAreaTextField.delegate = self
        buildingAreaTextField.delegate = self
        gardenAreaTextField.delegate = self
        ownerNameTextField.delegate = self
    }
    
    func isAllDataValid() -> Bool {
        if numberOfRoomsTextField.text != "" && numberOfMasterRoomsTextField.text != "" && numberOfDressingRoomsTextField.text != "" && numberOfBathRoomsTextField.text != "" && numberOfPiecesOfReceptionTextField.text != "" && landAreaTextField.text != "" && buildingAreaTextField.text != "" && gardenAreaTextField.text != "" && ownerNameTextField.text != "" {
            return true
        } else {
            return false
        }
    }
    
    func setupClassDataSet() {
        numberOfRooms = Int32(numberOfRoomsTextField.text!)!
        numberOfMasterRooms = Int32(numberOfMasterRoomsTextField.text!)!
        numberOfDressingRooms = Int32(numberOfDressingRoomsTextField.text!)!
        numberOfBathrooms = Int32(numberOfBathRoomsTextField.text!)!
        numberOfPiecesOfReception = Int32(numberOfPiecesOfReceptionTextField.text!)!
        landArea = Int32(landAreaTextField.text!)!
        buildingArea = Int32(buildingAreaTextField.text!)!
        gardenArea = Int32(gardenAreaTextField.text!)!
        ownerName = ownerNameTextField.text!
        
        if !(landArea > 0) || !(numberOfPiecesOfReception > 0) || !(numberOfRooms > 0) || !(buildingArea > 0) || !(gardenArea > 0) {
            showErrorAlertController()
        }
    }
    
    func moveToNextViewController() {
        performSegue(withIdentifier: "MoveToRealEstateDetailPartThreeViewController", sender: self)
    }
    
    func showErrorAlertController() {
        let errorAlert: UIAlertController = UIAlertController(title: "خطآ", message: "يبدو انه  هناك خطآ حدث اثناء ادخال البيانات رجائا قم بمراجعة بياناتك ", preferredStyle: .alert)
        
        errorAlert.addAction(UIAlertAction(title: "حسنا", style: .cancel, handler: { (alert) in
            return
        }))
        
        self.present(errorAlert, animated: true, completion: nil)
    }
    
    func validateTheClassDataSet() {
        if isAllDataValid() {
            setupClassDataSet()
        } else {
            showErrorAlertController()
        }
    }
}
