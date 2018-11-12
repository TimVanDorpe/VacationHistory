//
//  DetailsViewController.swift
//  VacationHistory
//
//  Created by Tim Van Dorpe on 19/08/18.
//  Copyright © 2018 Tim Van Dorpe. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import RealmSwift
class DetailsViewController:UIViewController{
    
    var buildings : Results<Building>!

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var descfield: UITextView!
    
    @IBAction func cancel(_ sender: UIButton) {
         self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var warning: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = RealmService.shared.realm
        
        buildings = realm.objects(Building.self)
        
    }
    @IBAction func saveAction(_ sender: Any) {
        //Hier haal ik de data uit de textfields
        let nameString:String = nameField.text!
        let descriptionString:String = descfield.text!
        warning.textColor = UIColor.red        
        if(nameString != ""){
            
            warning.text = "No warnings"
            
            let newMapPin:MapPin = MapPin(title: nameString , subtitle: descriptionString , coordinate:LocationController.deviceLocation())
            
            //add the mappin
            NotificationCenter.default.post(name : BuildingsController.BUILDING_ADDED_NOTIFICATION , object: newMapPin)
            let newBuilding:Building = Building(name: nameString , desscription: descriptionString , latitude:LocationController.deviceLocation().latitude, longitude:LocationController.deviceLocation().longitude)
            
            RealmService.shared.create(newBuilding)
            buildings = buildings.sorted(byKeyPath: "name", ascending: true)
            self.dismiss(animated: true, completion: nil)
        }
        else{
            self.warning.text = "You have to fill in the name of the building"
            //
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

