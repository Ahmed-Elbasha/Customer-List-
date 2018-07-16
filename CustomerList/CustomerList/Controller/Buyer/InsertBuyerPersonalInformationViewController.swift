//
//  InsertBuyerPersonalInformationViewController.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/4/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class InsertBuyerPersonalInformationViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var buyerNameTextField: UITextField!
    @IBOutlet weak var buyerNationalityTextField: UITextField!
    @IBOutlet weak var birthDateDatePicker: UIDatePicker!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var maleButton: UIButton!
    
    // MARK: Class Attributes
    var buyerName: String!
    var nationality: String!
    var birthDate: String!
    var genderInString: String!
    
    // MARK: Color Objects
    var lightMagenta: UIColor = UIColor(displayP3Red: CGFloat(0.98), green: CGFloat(0.64), blue: CGFloat(0.9), alpha: CGFloat(0.6))
    var magenta: UIColor = .magenta
    var lightCyan: UIColor = UIColor(displayP3Red: CGFloat(0.00), green: CGFloat(0.59), blue: CGFloat(1.0), alpha: CGFloat(0.3))
    var cyan: UIColor = .cyan
    
    // MARK: Class Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        buyerNameTextField.delegate = self
        buyerNationalityTextField.delegate = self
    }

    // MARK: IBActions
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func femaleButtonPressed(_ sender: Any) {
        self.makeFemaleButtonSelected()
    }
    
    @IBAction func maleButtonPressed(_ sender: Any) {
        self.makeMaleButtonSelected()
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        self.setClassData()
        if self.isDataValid() {
            performSegue(withIdentifier: "MoveToInsertBuyerMaritalAndFamilyInformationViewController", sender: Any?.self)
        } else {
            self.showErrorAlertController()
        }
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MoveToInsertBuyerMaritalAndFamilyInformationViewController" {
            let insertBuyerMaritalAndFamilyInformationVC = segue.destination as! InsertBuyerMaritalAndFamilyInformationViewController
            insertBuyerMaritalAndFamilyInformationVC.initWithData(name: self.buyerName, nationality: self.nationality, birthdate: self.birthDate, gender: self.genderInString)
        }
    }
    
}
