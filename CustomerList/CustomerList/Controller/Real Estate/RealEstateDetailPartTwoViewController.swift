//
//  RealEstateDetailPartTwoViewController.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/4/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class RealEstateDetailPartTwoViewController: UIViewController {
    
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

        // Do any additional setup after loading the view.
    }
    
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
