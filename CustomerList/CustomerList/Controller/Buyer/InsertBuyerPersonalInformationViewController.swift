//
//  InsertBuyerPersonalInformationViewController.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/4/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class InsertBuyerPersonalInformationViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var buyerNameTextField: UITextField!
    @IBOutlet weak var buyerNationalityTextField: UITextField!
    @IBOutlet weak var birthDateDatePicker: UIDatePicker!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var maleButton: UIButton!
    
    var buyerName: String!
    var nationality: String!
    var birthDate: String!
    var genderInString: String!
    
    var lightMagenta: UIColor = UIColor(displayP3Red: CGFloat(0.98), green: CGFloat(0.64), blue: CGFloat(0.9), alpha: CGFloat(0.6))
    var magenta: UIColor = .magenta
    var lightCyan: UIColor = UIColor(displayP3Red: CGFloat(0.00), green: CGFloat(0.59), blue: CGFloat(1.0), alpha: CGFloat(0.3))
    var cyan: UIColor = .cyan
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buyerNameTextField.delegate = self
        buyerNationalityTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.makeFemaleButtonSelected()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeMaleButtonSelected() {
        maleButton.backgroundColor = cyan
        makeFemaleButtonNotSelected()
    }
    
    func makeMaleButtonNotSelected() {
        maleButton.backgroundColor = lightCyan
    }
    
    func makeFemaleButtonSelected() {
        femaleButton.backgroundColor = magenta
        makeMaleButtonNotSelected()
    }
    
    func makeFemaleButtonNotSelected() {
        femaleButton.backgroundColor = lightMagenta
    }

    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func femaleButtonPressed(_ sender: Any) {
        makeFemaleButtonSelected()
    }
    
    @IBAction func maleButtonPressed(_ sender: Any) {
        makeMaleButtonSelected()
    }
    
    func isDataValid() -> Bool {
        if buyerName != "" && nationality != "" && birthDate == birthDateDatePicker.date.description {
            return true
        } else {
            return false
        }
    }
    
    func setGenderInStringValue() {
        if maleButton.backgroundColor == cyan {
            genderInString = Gender.male.rawValue
        }
        
        if femaleButton.backgroundColor == magenta {
            genderInString = Gender.female.rawValue
        }
    }
    
    func setClassData() {
        buyerName = buyerNameTextField.text!
        nationality = buyerNationalityTextField.text!
        setGenderInStringValue()
        birthDate = birthDateDatePicker.date.description
    }
    
    func showErrorAlertController() {
        let alert: UIAlertController = UIAlertController(title: "خطآ", message: "يبدو انه  هناك خطآ حدث اثناء ادخال البيانات رجائا قم بمراجعة بياناتك ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "حسنا", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        setClassData()
        if isDataValid() {
            performSegue(withIdentifier: "MoveToInsertBuyerMaritalAndFamilyInformationViewController", sender: Any?.self)
        } else {
            showErrorAlertController()
        }
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.clearButtonMode = .whileEditing
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MoveToInsertBuyerMaritalAndFamilyInformationViewController" {
            let insertBuyerMaritalAndFamilyInformationVC = segue.destination as! InsertBuyerMaritalAndFamilyInformationViewController
            insertBuyerMaritalAndFamilyInformationVC.initWithData(name: self.buyerName, nationality: self.nationality, birthdate: self.birthDate, gender: self.genderInString)
        }
    }
    
}
