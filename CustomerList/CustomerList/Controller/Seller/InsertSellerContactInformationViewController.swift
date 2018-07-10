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
    
    @IBAction func showData(_ sender: Any) {
        print(" Name: \(self.sellerName) \n Nationality: \(self.sellerNationalityy) \n birthday: \(self.birthdayDate) \n Gender: \(self.sellerGender)")
    }
}
