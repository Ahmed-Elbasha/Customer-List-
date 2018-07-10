//
//  InsertSellerContactInformationViewController.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/4/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate
class InsertSellerContactInformationViewController: UIViewController {
    
    @IBOutlet weak var phoneLineNumberTextField: UITextField!
    @IBOutlet weak var firstMobileNumberTextField: UITextField!
    @IBOutlet weak var secondMobileNumberTextField: UITextField!
    @IBOutlet weak var watsNumberTestField: UITextField!
    @IBOutlet weak var firstEmailAddressTextField: UITextField!
    @IBOutlet weak var secondEmailAddressTextField: UITextField!
    @IBOutlet weak var firstAddressLineTextField: UITextField!
    @IBOutlet weak var secondAddressLineTextField: UITextField!
    
    var sellerName: String = ""
    var sellerNationalityy = ""
    var birthdayDate: Date = Date()
    var sellerGender: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initData(sellerName: String, sellerNationality: String, birthdayDate: Date, gender: String) {
        self.sellerName = sellerName
        self.sellerNationalityy = sellerNationality
        self.sellerGender = gender
        self.birthdayDate = birthdayDate
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
    
    @IBAction func createSellerWasPressed(_ sender: Any) {
    }
    
}
