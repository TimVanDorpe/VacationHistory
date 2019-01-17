//
//  ListDetailViewController.swift
//  VacationHistory
//
//  Created by Tim Van Dorpe on 10/10/18.
//  Copyright © 2018 Tim Van Dorpe. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
class ListDetailViewController: UIViewController{
    
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtDesc: UITextView!
    @IBOutlet weak var lblLong: UILabel!
    @IBOutlet weak var lblLat: UILabel!
    
    

   
    
    var building: Building!
    override func viewDidLoad() {
   
        lblTitle.text = building.name
        lblDate.text = building.date
        lblRating.text = String("rating : \(building.rating)")
        lblLong.text = String("longitude : \(building.longitude)")
        lblLat.text = String("latitude : \(building.latitude)")
        txtDesc.text = building.desscription
    }
   
   
    
    @IBAction func goToGallery(_ sender: Any) {
        performSegue(withIdentifier: "gallerysegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gallerysegue" {
            
            let destinationViewController = segue.destination as? CollectionViewController
            destinationViewController?.building = building
            
        }
      
    }
   
    
    @IBAction func exitt(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
}
