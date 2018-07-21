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
    
    // MARK: Set Delegate For ViewController UIControls
    func setDelegateForUIControls() {
        deliveryYearTextField.delegate = self
        constructionYearTextField.delegate = self
    }
    
    // MARK: Class's Data Validation and Setup
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
    
    // MARK: Saving Seller Data Operation.
    func saveApartmentData(_ completion: (_ complete: Bool) -> ()) {
        let managedContext = appDelegate.persistentContainer.viewContext 
        
        let apartment = NSEntityDescription.entity(forEntityName: "Apartment", in: managedContext)
        let newApartment = NSManagedObject(entity: apartment!, insertInto: managedContext)
        
        newApartment.setValue(self.areaName, forKey: "areaName")
        newApartment.setValue(self.compoundName, forKey: "compoundName")
        newApartment.setValue(self.stageNumber, forKey: "stageNumber")
        newApartment.setValue(self.floorNumber, forKey: "floorNumber")
        newApartment.setValue(self.buildingNumber, forKey: "buildingNumber")
        newApartment.setValue(self.unitNumber, forUndefinedKey: "unitNumber")
        newApartment.setValue(self.unitView, forUndefinedKey: "unitView")
        newApartment.setValue(self.numberOfElevators, forKey: "numberOfElevators")
        newApartment.setValue(self.numberOfBalconies, forKey: "numberOfBalconies")
        newApartment.setValue(self.numberOfRooms, forKey: "numberOfRooms")
        newApartment.setValue(self.numberOfMasterRooms, forKey: "numberOfMasterRooms")
        newApartment.setValue(self.numberOfDressingRooms, forKey: "numberOfDressingRooms")
        newApartment.setValue(self.numberOfBathrooms, forKey: "numberOfBathrooms")
        newApartment.setValue(self.numberOfPiecesOfReception, forKey: "numberOfPiecesOfReception")
        newApartment.setValue(self.landArea, forKey: "landArea")
        newApartment.setValue(self.buildingArea, forKey: "buildingArea")
        newApartment.setValue(self.gardenArea, forKey: "gardenArea")
        newApartment.setValue(self.ownerName, forKey: "ownerName")
        newApartment.setValue(self.contractType, forKey: "contractType")
        newApartment.setValue(self.unitType, forKey: "unitType")
        newApartment.setValue(self.finishingType, forKey: "finishingType")
        newApartment.setValue(self.deliveryYear, forKey: "deliveryYear")
        newApartment.setValue(self.constructionYear, forKey: "constructionYear")
        
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
