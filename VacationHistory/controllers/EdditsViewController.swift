//
//  EdditsViewController.swift
//  VacationHistory
//
//  Created by Tim Van Dorpe on 20/01/19.
//  Copyright © 2019 Tim Van Dorpe. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class EdditsViewController: UIViewController {
    @IBOutlet weak var lblTitle: UILabel!
 
    @IBOutlet weak var lblWarning: UILabel!
    
    @IBOutlet weak var txtDesc: UITextView!
    @IBOutlet weak var txtName: UITextField!
    var building :Building!
    
    @IBOutlet weak var ratingStackView: RatingController!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWarning.text = ""
        txtName.text = building.name
        txtDesc.text = building.desscription
        lblTitle.text = String(describing:"Edit  \(building.name ?? "Edit")")
        ratingStackView.setStarsRating(rating: building.rating)
    
        
    }
   
    
    @IBAction func save(_ sender: Any) {
        if(txtName.text != ""){
        let dict: [String: Any?] = ["name": txtName.text,
                                    "desscription": txtDesc.text,
                                    "rating": ratingStackView.starsRating]
        RealmService.shared.update(building, with: dict)
        self.dismiss(animated: true, completion: nil)
        }
        else{
            lblWarning.text = "You have to fill in a name !"
        }
        
        
    }
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

   
}
