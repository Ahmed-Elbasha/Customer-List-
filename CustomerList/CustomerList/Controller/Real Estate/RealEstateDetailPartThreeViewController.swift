//
//  RealEstateDetailPartThreeViewController.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/5/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class RealEstateDetailPartThreeViewController: UIViewController {

    // MARK: Class Attributes
    var areaName: String = ""
    var compoundName: String = ""
    var stageNumber: Int32 = 0
    var floorNumber: Int32 = 0
    var buildingNumber: Int32 = 0
    var unitNumber: Int32 = 0
    var unitView: String = ""
    var numberOfElevators: Int32 = 0
    var numberOfBalconies: Int32 = 0
    var numberOfRooms: Int32 = 0
    var numberOfMasterRooms: Int32 = 0
    var numberOfDressingRooms: Int32 = 0
    var numberOfBathrooms: Int32 = 0
    var numberOfPiecesOfReception: Int32 = 0
    var landArea: Int32 = 0
    var buildingArea: Int32 = 0
    var gardenArea: Int32 = 0
    var ownerName: String = ""
    
    // MARK: Class Life Cycle Methods.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: View Controller Received Data Setup
    func initWithData(areaName: String, compoundName: String, stageNumber: Int32, floorNumber: Int32, buildingNumber: Int32, unitNumber: Int32, unitView: String, numberOfElevators: Int32, numberOfBalconies: Int32, numberOfRooms: Int32, numberOfMasterRooms: Int32, numberOfDressingRooms: Int32, numberOfBathrooms: Int32, numberOfPiecesOfReception: Int32, landArea: Int32, buildingArea: Int32, gardenArea: Int32, ownerName: String) {
        self.areaName = areaName
        self.compoundName = compoundName
        self.stageNumber = stageNumber
        self.floorNumber = floorNumber
        self.buildingNumber = buildingNumber
        self.unitNumber = unitNumber
        self.unitView = unitView
        self.numberOfElevators = numberOfElevators
        self.numberOfBalconies = numberOfBalconies
        self.numberOfRooms = numberOfRooms
        self.numberOfMasterRooms = numberOfMasterRooms
        self.numberOfDressingRooms = numberOfDressingRooms
        self.numberOfBathrooms = numberOfBathrooms
        self.numberOfPiecesOfReception = numberOfPiecesOfReception
        self.landArea = landArea
        self.buildingArea = buildingArea
        self.gardenArea = gardenArea
        self.ownerName = ownerName
    }
    
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
