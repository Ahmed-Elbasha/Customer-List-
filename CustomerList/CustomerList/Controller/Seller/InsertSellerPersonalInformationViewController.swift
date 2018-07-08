//
//  InsertSellerPersonalInformationViewController.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 6/10/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class InsertSellerPersonalInformationViewController: UIViewController {
    
    
    @IBOutlet weak var sellerNameTextField: UITextField!
    @IBOutlet weak var nationalityTextField: UITextField!
    @IBOutlet weak var birthDayDatePicker: UIDatePicker!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var maleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func femaleButtonWasPressed(_ sender: Any) {
    }
    
    @IBAction func maleButtonWasPressed(_ sender: Any) {
    }
    
}
