//
//  RealEstateDetailPartTwoViewController.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/4/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class RealEstateDetailPartTwoViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var numberOfRoomsTextField: UITextField!
    @IBOutlet weak var numberOfMasterRoomsTextField: UITextField!
    @IBOutlet weak var numberOfDressingRoomsTextField: UITextField!
    @IBOutlet weak var numberOfBathRoomsTextField: UITextField!
    @IBOutlet weak var numberOfPiecesOfReceptionTextField: UITextField!
    @IBOutlet weak var landAreaTextField: UITextField!
    @IBOutlet weak var buildingAreaTextField: UITextField!
    @IBOutlet weak var gardenAreaTextField: UITextField!
    @IBOutlet weak var ownerNameTextField: UITextField!
    
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
    func initWithData(areaName: String, compoundName: String, stageNumber: Int32, floorNumber: Int32, buildingNumber: Int32, unitNumber: Int32, unitView: String, numberOfElevators: Int32, numberOfBalconies: Int32) {
        self.areaName = areaName
        self.compoundName = compoundName
        self.stageNumber = stageNumber
        self.floorNumber = floorNumber
        self.buildingNumber = buildingNumber
        self.unitNumber = unitNumber
        self.unitView = unitView
        self.numberOfElevators = numberOfElevators
        self.numberOfBalconies = numberOfBalconies
    }
    
    // MARK: IBActions
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        self.validateTheClassDataSet()
        self.moveToNextViewController()
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MoveToRealEstateDetailPartThreeViewController" {
            let realEstateDetailPartThreeVC = segue.destination as! RealEstateDetailPartThreeViewController
            realEstateDetailPartThreeVC.initWithData(areaName: areaName, compoundName: compoundName, stageNumber: stageNumber, floorNumber: floorNumber, buildingNumber: buildingNumber, unitNumber: unitNumber, unitView: unitView, numberOfElevators: numberOfElevators, numberOfBalconies: numberOfBalconies, numberOfRooms: numberOfRooms, numberOfMasterRooms: numberOfMasterRooms, numberOfDressingRooms: numberOfDressingRooms, numberOfBathrooms: numberOfBathrooms, numberOfPiecesOfReception: numberOfPiecesOfReception, landArea: landArea, buildingArea: buildingArea, gardenArea: gardenArea, ownerName: ownerName)
        }
    }
}
