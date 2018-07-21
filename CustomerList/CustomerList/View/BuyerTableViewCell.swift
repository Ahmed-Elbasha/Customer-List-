//
//  BuyerTableViewCell.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/13/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class BuyerTableViewCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var buyerNameLabel: UILabel!
    @IBOutlet weak var buyerNationalityLabel: UILabel!
    @IBOutlet weak var buyerBirthDateLabel: UILabel!
    @IBOutlet weak var buyerGenderLabel: UILabel!
    @IBOutlet weak var numberOfFamilyMembersLabel: UILabel!
    @IBOutlet weak var numberOfKidsLabel: UILabel!
    @IBOutlet weak var maritalStatusLabel: UILabel!
    @IBOutlet weak var phoneLineNumberLabel: UILabel!
    @IBOutlet weak var firstMobileNumberLabel: UILabel!
    @IBOutlet weak var secondMobileNumberLabel: UILabel!
    @IBOutlet weak var whatsNumberLabel: UILabel!
    @IBOutlet weak var firstEmailAddressLabel: UILabel!
    @IBOutlet weak var secondEmailAddressLabel: UILabel!
    @IBOutlet weak var firstAddressLineLabel: UILabel!
    @IBOutlet weak var secondAddressLineLabel: UILabel!
    
    // MARK: Class Life Cycle Methods.
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: Table View Cell Configuration
    func configureCell(buyer: Buyer) {
        buyerNameLabel.text = buyer.buyerName
        buyerNationalityLabel.text = buyer.nationality
        buyerBirthDateLabel.text = buyer.birthdate
        buyerGenderLabel.text = buyer.gender
        numberOfFamilyMembersLabel.text = String(describing: buyer.numberOfFamilyMembers)
        numberOfKidsLabel.text = String(describing: buyer.numberOfKids)
        maritalStatusLabel.text = buyer.maritalStatus
        phoneLineNumberLabel.text = String(describing: buyer.telephoneNumber)
        firstMobileNumberLabel.text = String(describing: buyer.mobileNumber1)
        secondMobileNumberLabel.text = String(describing: buyer.mobileNumber2)
        whatsNumberLabel.text = String(describing: buyer.whatsappNumber)
        firstEmailAddressLabel.text = buyer.emailAddress1
        secondEmailAddressLabel.text = buyer.emailAddress2
        firstAddressLineLabel.text = buyer.address1
        secondAddressLineLabel.text = buyer.address2
    }
    
}
