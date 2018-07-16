//
//  InsertSellerPersonalInformationViewController.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 6/10/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class InsertSellerPersonalInformationViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var sellerNameTextField: UITextField!
    @IBOutlet weak var nationalityTextField: UITextField!
    @IBOutlet weak var birthDayDatePicker: UIDatePicker!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var maleButton: UIButton!
    
    // MARK: Class's Attributes
    var sellerName: String = ""
    var sellerNationality: String = ""
    var genderInString: String = ""
    var textfieldTag: Int = 0
    var birthdayDate: String = ""
    
    // MARK: Color Objects
    var lightMagenta: UIColor = UIColor(red: CGFloat(0.98), green: CGFloat(0.64), blue: CGFloat(0.9), alpha: CGFloat(0.6))
    var magenta: UIColor = UIColor.magenta
    var lightCyan: UIColor = UIColor(red: 0, green: 152, blue: 255, alpha: 0.3)
    var cyan: UIColor = UIColor.cyan

    // MARK: Application Life Cycle Methods.
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
    
    // MARK: IBActions.
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func femaleButtonWasPressed(_ sender: Any) {
        makeFemaleSelected()
    }
    
    @IBAction func maleButtonWasPressed(_ sender: Any) {
        makeMaleSelected()
    }
    
    @IBAction func nextButtonWasPressed(_ sender: Any) {
        self.validateClassDataSet()
        self.performSegue(withIdentifier: "MoveToInsertSellerContactInformationViewController", sender: Any?.self)
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MoveToInsertSellerContactInformationViewController" {
            let insertSellerContactInformationVC = segue.destination as! InsertSellerContactInformationViewController
            insertSellerContactInformationVC.initData(sellerName: self.sellerName, sellerNationality: self.sellerNationality, birthdayDate: birthdayDate, gender: genderInString)
        }
    }
    
}
