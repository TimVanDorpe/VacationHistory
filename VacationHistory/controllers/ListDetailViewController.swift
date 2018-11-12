//
//  ListDetailViewController.swift
//  VacationHistory
//
//  Created by Tim Van Dorpe on 10/10/18.
//  Copyright © 2018 Tim Van Dorpe. All rights reserved.
//

import Foundation
import UIKit
class ListDetailViewController: UIViewController{
    
   
   
    @IBAction func exitt(_ sender: UIButton) {
         self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var lblTitle: UILabel!
    
    var building: Building!
    override func viewDidLoad() {
   
        lblTitle.text = building.name
        
    }
    
    
}
