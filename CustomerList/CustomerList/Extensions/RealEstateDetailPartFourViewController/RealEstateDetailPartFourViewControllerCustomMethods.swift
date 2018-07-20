//
//  RealEstateDetailPartFourViewControllerCustomMethods.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/19/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension RealEstateDetailPartFourViewController {
    func setDelegateForUIControls() {
        deliveryYearTextField.delegate = self
        constructionYearTextField.delegate = self
    }
    
    func isAllDataValid() -> Bool {
        if deliveryYearTextField.text != "" && constructionYearTextField.text != "" {
            return true
        } else {
            return false
        }
    }
    
    func setClassDataSet() {
        deliveryYear = Int32(deliveryYearTextField.text!)!
        constructionYear = Int32(constructionYearTextField.text!)!
        
        if !(deliveryYear > 0 && deliveryYearTextField.text?.count == 4) && !(constructionYear > 0 && constructionYearTextField.text?.count == 4) {
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
        if isAllDataValid() {
            setClassDataSet()
        } else {
            showErrorAlertController()
        }
    }
    
    func saveApartmentData(_ completion: (_ complete: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let apartment = Apartment(context: managedContext)
        
        apartment.areaName = self.areaName
        apartment.compoundName = self.compoundName
        apartment.stageNumber = self.stageNumber
        apartment.floorNumber = self.floorNumber
        apartment.buildingNumber = self.buildingNumber
        apartment.unitNumber = self.unitNumber
        apartment.view = self.unitView
        apartment.numberOfElevators = self.numberOfElevators
        apartment.numberOfBalconies = self.numberOfBalconies
        apartment.numberOfRooms = self.numberOfRooms
        apartment.numberOfMasterRooms = self.numberOfMasterRooms
        apartment.numberOfDressingRooms = self.numberOfDressingRooms
        apartment.numberOfBathrooms = self.numberOfBathrooms
        apartment.numberOfPiecesOfReception = self.numberOfPiecesOfReception
        apartment.landArea = self.landArea
        apartment.buildingArea = self.buildingArea
        apartment.gardenArea = self.gardenArea
        apartment.ownerName = self.ownerName
        apartment.contractType = self.contractType
        apartment.unitType = self.unitType
        apartment.finishingType = self.finishingType
        apartment.deliveryYear = String(describing: deliveryYear)
        apartment.constructionYear = String(describing: constructionYear)
        
        do {
            try managedContext.save()
            print("Data Saved Successfully.")
            completion(true)
        } catch {
            print("Data Saving Failed. \(error.localizedDescription)")
            completion(false)
        }
    }
    
    func showOperationSuccessAlertController() {
        let successAlert = UIAlertController(title: "نجاح العملية", message: "تم ادخال البيانات بنجاح", preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "حسنا", style: .default, handler: { (action) in
            self.moveBackToMainScene()
        }))
        self.present(successAlert, animated: true, completion: nil)
    }
    
    func showOperationFailureAlertController() {
        let failureAlert = UIAlertController(title: "فشل العملية", message: "فشل اثناء التنفيذ", preferredStyle: .alert)
        failureAlert.addAction(UIAlertAction(title: "حسنا", style: .default, handler: { (alert) in
            return
        }))
        self.present(failureAlert, animated: true, completion: nil)
    }
    
    func moveBackToMainScene() {
        let realEstateDetailInfoPartOneVC = storyboard?.instantiateViewController(withIdentifier: "RealEstateDetailInfoPartOneViewController") as! RealEstateDetailInfoPartOneViewController
        self.present(realEstateDetailInfoPartOneVC, animated: true, completion: nil)
        realEstateDetailInfoPartOneVC.dismiss(animated: true, completion: nil)
    }
    
    func initiateSavingApartmentDataOperation() {
        saveApartmentData { (complete) in
            if complete {
                showOperationSuccessAlertController()
            } else {
                showOperationFailureAlertController()
            }
        }
    }
    
    
    
    func showConfirmationAlertController() {
        // Saving Seller Data to CoreData xcmodeldata.
        let confirmationAlert = UIAlertController(title: "Success", message: "انت على وشك آضافة بيانات جديدة هل انت متآكد؟", preferredStyle: .alert)
        
        confirmationAlert.addAction(UIAlertAction(title: "نعم", style: .default, handler: { (alert) in
            self.initiateSavingApartmentDataOperation()
        }))
        
        confirmationAlert.addAction(UIAlertAction(title: "الغاء التنفيد", style: .cancel, handler: { (alert) in
            return
        }))
        
        self.present(confirmationAlert, animated: true, completion: nil)
    }
    
    func confiremTheinitiationOfSavingApartmentObjectData() {
        showConfirmationAlertController()
    }
}
