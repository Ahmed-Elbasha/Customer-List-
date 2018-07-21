//
//  SellerTableViewCell.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/13/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class SellerTableViewCell: UITableViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var sellerNameLabel: UILabel!
    @IBOutlet weak var sellerNationalityLabel: UILabel!
    @IBOutlet weak var sellerBirthdayLabel: UILabel!
    @IBOutlet weak var sellerGenderLabel: UILabel!
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
    func configureCell(seller: Seller) {
        sellerNameLabel.text = seller.sellerName
        sellerNationalityLabel.text = seller.nationality
        sellerBirthdayLabel.text = seller.birthdate
        sellerGenderLabel.text = seller.gender
        phoneLineNumberLabel.text = String(describing: seller.telephoneNumber)
        firstMobileNumberLabel.text = String(describing: seller.mobileNumber1)
        secondMobileNumberLabel.text = String(describing: seller.mobileNumber2)
        whatsNumberLabel.text = String(describing: seller.whatsappNumber)
        firstEmailAddressLabel.text = seller.emailAddress1
        secondEmailAddressLabel.text = seller.emailAddress2
        firstAddressLineLabel.text = seller.address1
        secondAddressLineLabel.text = seller.address2
    }
    
}
