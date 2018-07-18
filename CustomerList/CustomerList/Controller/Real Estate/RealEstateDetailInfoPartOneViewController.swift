//
//  RealEstateDetailInfoPartOneViewController.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/4/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class RealEstateDetailInfoPartOneViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet weak var areaNameTextField: UITextField!
    @IBOutlet weak var compoundNameTextField: UITextField!
    @IBOutlet weak var stageNumberTextField: UITextField!
    @IBOutlet weak var floorNumberTextField: UITextField!
    @IBOutlet weak var buildingNumberTextField: UITextField!
    @IBOutlet weak var unitNumberTextField: UITextField!
    @IBOutlet weak var viewTextField: UITextField!
    @IBOutlet weak var numberOfElevatorsTextField: UITextField!
    @IBOutlet weak var numberOfBalconiesTextField: UITextField!
    
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
    
    // MARK: Class Life Cycle Methods.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDelegateForUIControls()
    }
    
    // MARK: IBActions
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        self.validateClassDataSet()
        self.moveTiNextViewController()
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MoveToRealEstateDetailPartTwoViewController" {
            let realEstateDetailPartTwoViewController = segue.destination as! RealEstateDetailPartTwoViewController
            realEstateDetailPartTwoViewController.initWithData(areaName: areaName, compoundName: compoundName, stageNumber: stageNumber, floorNumber: floorNumber, buildingNumber: buildingNumber, unitNumber: unitNumber, unitView: unitView, numberOfElevators: numberOfElevators, numberOfBalconies: numberOfBalconies)
        }
    }
}
