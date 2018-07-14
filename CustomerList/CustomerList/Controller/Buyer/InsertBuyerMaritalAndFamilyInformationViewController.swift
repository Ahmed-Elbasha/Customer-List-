//
//  InsertBuyerMaritalAndFamilyInformationViewController.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/4/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class InsertBuyerMaritalAndFamilyInformationViewController: UIViewController {
    
    var buyerName: String = ""
    var buyerNationality: String = ""
    var birthdate: String = ""
    var gender: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initWithData(name: String, nationality: String, birthdate: String, gender: String) {
        self.buyerName = name
        self.buyerNationality = nationality
        self.birthdate = birthdate
        self.gender = gender
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
