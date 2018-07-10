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
    var birthdayDate: Date!
    
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
        textfieldTag = textField.tag
        if (textfieldTag == 0 || textfieldTag == 1) {
            if (textField.text == "") {
                return false
            } else {
                textField.clearButtonMode = .whileEditing
                return true
            }
        } else {
            return false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textfieldTag = textField.tag
        if textfieldTag == 0 && (textField.text?.isEmpty)! != true{
            sellerName = textField.text!
        }
        if textfieldTag == 1 && textField.text?.isEmpty != true{
            sellerNationality = textField.text!
        }
        textField.resignFirstResponder()
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
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
        genderInString = Gender.female.rawValue
        makeMaleNotSelected()
    }
    
    func makeMaleNotSelected() {
        maleButton.backgroundColor = lightCyan
    }
    
    func makeMaleSelected() {
        maleButton.backgroundColor = cyan
        genderInString = Gender.male.rawValue
        makeFemaleNotSelected()
    }
    
    func makeFemaleNotSelected() {
        femaleButton.backgroundColor = lightMagenta
    }
    
    @IBAction func nextButtonWasPressed(_ sender: Any) {
        if !isDataValid() {
            let alert: UIAlertController = UIAlertController(title: "خطآ", message: "يبدو انه  هناك خطآ حدث اثناء ادخال البيانات رجائا قم بمراجعة بياناتك ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "حسنا", style: .cancel, handler: { (alert) in
                return
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            let insertSellerContactInformationVC = storyboard?.instantiateViewController(withIdentifier: "InsertSellerContactInformationViewController") as! InsertSellerContactInformationViewController
            insertSellerContactInformationVC.initData(sellerName: self.sellerName, sellerNationality: self.sellerNationality, birthdayDate: birthdayDate, gender: genderInString)
            self.present(insertSellerContactInformationVC, animated: true, completion: nil)
        }
    }
    
    func isDataValid() -> Bool {
        if birthdayDate != nil && sellerName.isEmpty != true && sellerNationality.isEmpty != true && genderInString.isEmpty != true {
            return true
        } else {
            return false
        }
    }
    
    @IBAction func birthdateDatePickerValueChanged(_ sender: Any) {
        birthdayDate = birthDayDatePicker.date
    }
    
}
