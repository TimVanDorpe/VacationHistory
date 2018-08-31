//
//  AlertService.swift
//  VacationHistory
//
//  Created by Tim Van Dorpe on 31/08/18.
//  Copyright © 2018 Tim Van Dorpe. All rights reserved.
//

import Foundation


import UIKit

class AlertService {
    
    private init() {}
    
    static func updateAlert(in vc: UIViewController,
                            building: Building,
                            completion: @escaping (String, String?) -> Void) {
        
        let alert = UIAlertController(title: "Update building", message: nil, preferredStyle: .alert)
        alert.addTextField{ (nameTF) in
            nameTF.placeholder = "Enter name"
            nameTF.text = building.name
            var oldFrame = nameTF.frame
            oldFrame.origin.y = 40
            oldFrame.size.height = 60
            nameTF.frame = oldFrame
            
        }
        alert.addTextField { (descTF) in
            descTF.placeholder = "Enter description"
            descTF.text = building.desscription
            var oldFrame = descTF.frame
            oldFrame.origin.y = 404
            oldFrame.size.height = 604
            descTF.frame = oldFrame
        }
        
        
        let action = UIAlertAction(title: "Update", style: .default) { (_) in
            guard let name = alert.textFields?.first?.text,
                let descString = alert.textFields?.last?.text
                else { return }
            
            
            let email = descString == "" ? nil : descString
            
            completion(name, email)
        }
        
        alert.addAction(action)
        vc.present(alert, animated: true)
    }
    
}
