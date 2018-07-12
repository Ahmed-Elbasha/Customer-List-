//
//  InsertSellerPersonalInformationViewController.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 6/10/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class InsertSellerPersonalInformationViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var sellerNameTextField: UITextField!
    @IBOutlet weak var nationalityTextField: UITextField!
    @IBOutlet weak var birthDayDatePicker: UIDatePicker!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var maleButton: UIButton!
    
    var sellerName: String = ""
    var sellerNationality: String = ""
    var genderInString: String = ""
    var textfieldTag: Int = 0
    var birthdayDate: String = ""
    
    // Color Objects
    var lightMagenta: UIColor = UIColor(red: CGFloat(0.98), green: CGFloat(0.64), blue: CGFloat(0.9), alpha: CGFloat(0.6))
    var magenta: UIColor = UIColor.magenta
    var lightCyan: UIColor = UIColor(red: 0, green: 152, blue: 255, alpha: 0.3)
    var cyan: UIColor = UIColor.cyan

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sellerNameTextField.delegate = self
        nationalityTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.makeFemaleSelected()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.clearButtonMode = .whileEditing
        return (textField.text != "")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func femaleButtonWasPressed(_ sender: Any) {
        makeFemaleSelected()
    }
    
    @IBAction func maleButtonWasPressed(_ sender: Any) {
        makeMaleSelected()
    }
    
    func makeFemaleSelected() {
        femaleButton.backgroundColor = magenta
        makeMaleNotSelected()
    }
    
    func makeMaleNotSelected() {
        maleButton.backgroundColor = lightCyan
    }
    
    func makeMaleSelected() {
        maleButton.backgroundColor = cyan
        makeFemaleNotSelected()
    }
    
    func makeFemaleNotSelected() {
        femaleButton.backgroundColor = lightMagenta
    }
    
    @IBAction func nextButtonWasPressed(_ sender: Any) {
        self.setClassValues()
        
        if !isDataValid() {
            let alert: UIAlertController = UIAlertController(title: "خطآ", message: "يبدو انه  هناك خطآ حدث اثناء ادخال البيانات رجائا قم بمراجعة بياناتك ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "حسنا", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            self.performSegue(withIdentifier: "MoveToInsertSellerContactInformationViewController", sender: Any?.self)
        }
    }
    
//    @IBAction func birthdateDatePickerValueChanged(_ sender: Any) {
//        birthdayDate = birthDayDatePicker.date
//    }
    
    func isDataValid() -> Bool {
        if sellerName != "" && sellerNationality != "" && birthdayDate  == birthDayDatePicker.description {
            return true
        } else {
            return false
        }
    }
    
    func setClassValues() {
        sellerName = sellerNameTextField.text!
        sellerNationality = nationalityTextField.text!
        
        if maleButton.backgroundColor == cyan {
            genderInString = Gender.male.rawValue
        } else if femaleButton.backgroundColor == magenta {
            genderInString = Gender.female.rawValue
        }
        
        birthdayDate = birthDayDatePicker.description
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MoveToInsertSellerContactInformationViewController" {
            let insertSellerContactInformationVC = segue.destination as! InsertSellerContactInformationViewController
            insertSellerContactInformationVC.initData(sellerName: self.sellerName, sellerNationality: self.sellerNationality, birthdayDate: birthdayDate, gender: genderInString)
        }
    }
    
}
