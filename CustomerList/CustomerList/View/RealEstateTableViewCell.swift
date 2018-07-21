//
//  RealEstateTableViewCell.swift
//  CustomerList
//
//  Created by Ahmed Elbasha on 7/13/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class RealEstateTableViewCell: UITableViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak var areaNameLabel: UILabel!
    @IBOutlet weak var compoundNameLabel: UILabel!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var stageNumberLabel: UILabel!
    @IBOutlet weak var floorNumberLabel: UILabel!
    @IBOutlet weak var buildingNumberLabel: UILabel!
    @IBOutlet weak var unitNumberLabel: UILabel!
    @IBOutlet weak var viewLabel: UILabel!
    @IBOutlet weak var numberOfElevatorsLabel: UILabel!
    @IBOutlet weak var numberOfBalconiesLabel: UILabel!
    @IBOutlet weak var numberOfRoomsLabel: UILabel!
    @IBOutlet weak var numberOfMasterRoomsLabel: UILabel!
    @IBOutlet weak var numberOfDressingRoomsLabel: UILabel!
    @IBOutlet weak var numberOfBathroomsLabel: UILabel!
    @IBOutlet weak var numberOfPiecesOfReceptionsLabel: UILabel!
    @IBOutlet weak var landAreaLabel: UILabel!
    @IBOutlet weak var buildingAreaLabel: UILabel!
    @IBOutlet weak var gardenAreaLabel: UILabel!
    @IBOutlet weak var contractTypeLabel: UILabel!
    @IBOutlet weak var apartmentTypeLabel: UILabel!
    @IBOutlet weak var finishingTypeLabel: UILabel!
    @IBOutlet weak var constructionDateLabel: UILabel!
    @IBOutlet weak var deliveryDateLabel: UILabel!
    
    // MARK: Class Life Cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    // MARK: Table View Cell Configuration
    func configureCell(apartment: Apartment) {
        areaNameLabel.text = apartment.areaName
        compoundNameLabel.text = apartment.compoundName
        ownerNameLabel.text = apartment.ownerName
        stageNumberLabel.text = String(describing: apartment.stageNumber)
        floorNumberLabel.text = String(describing: apartment.floorNumber)
        buildingNumberLabel.text = String(describing: apartment.buildingNumber)
        unitNumberLabel.text = String(describing: apartment.unitNumber)
        viewLabel.text = apartment.unitView
        numberOfElevatorsLabel.text = String(describing: apartment.numberOfElevators)
        numberOfBalconiesLabel.text = String(describing: apartment.numberOfBalconies)
        numberOfRoomsLabel.text = String(describing: apartment.numberOfRooms)
        numberOfMasterRoomsLabel.text = String(describing: apartment.numberOfMasterRooms)
        numberOfDressingRoomsLabel.text = String(describing: apartment.numberOfDressingRooms)
        numberOfBathroomsLabel.text = String(describing: apartment.numberOfBathrooms)
        numberOfPiecesOfReceptionsLabel.text = String(describing: apartment.numberOfPiecesOfReception)
        landAreaLabel.text = String(describing: apartment.landArea)
        buildingAreaLabel.text = String(describing: apartment.buildingArea)
        gardenAreaLabel.text = String(describing: apartment.gardenArea)
        contractTypeLabel.text = apartment.contractType
        apartmentTypeLabel.text = apartment.unitType
        finishingTypeLabel.text = apartment.finishingType
        constructionDateLabel.text = apartment.constructionYear
        deliveryDateLabel.text = apartment.deliveryYear
    }
    
}
