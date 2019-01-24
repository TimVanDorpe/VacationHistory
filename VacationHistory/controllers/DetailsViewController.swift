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
import CoreLocation
class DetailsViewController:UIViewController{
    
    var buildings : Results<Building>!
    let locationManager = CLLocationManager()

    @IBOutlet weak var ratingStackView: RatingController!
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
        let rating = ratingStackView.starsRating
        if(nameString != "" && rating != 0){
         let newMapPin:MapPin = MapPin(title: nameString , subtitle: descriptionString , coordinate:CLLocationCoordinate2DMake(CLLocationDegrees(LocationController.currentLocation?.coordinate.latitude ?? 0),CLLocationDegrees(LocationController.currentLocation?.coordinate.longitude ?? 0)))
            //add the mappin to the map
            NotificationCenter.default.post(name : BuildingsController.BUILDING_ADDED_NOTIFICATION , object: newMapPin)
            //make newbuilding with given data
            let newBuilding:Building = Building(name: nameString , desscription: descriptionString , latitude:LocationController.currentLocation?.coordinate.latitude ?? 0, longitude:LocationController.currentLocation?.coordinate.longitude ?? 0)
            newBuilding.rating = ratingStackView.starsRating
            RealmService.shared.create(newBuilding)
            buildings = buildings.sorted(byKeyPath: "name", ascending: true)
            self.dismiss(animated: true, completion: nil)
        }
        else{
            self.warning.text = "Rating and name are required !"
            //
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

