//
//  DVCell.swift
//  VacationHistory
//
//  Created by Tim Van Dorpe on 22/08/18.
//  Copyright © 2018 Tim Van Dorpe. All rights reserved.
//

import Foundation
import UIKit

class DVCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    func configure(with building : Building) {
        nameLabel.text = building.name
        descriptionLabel.text = building.desscription
        
    }
    
}
