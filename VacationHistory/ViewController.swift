//
//  ViewController.swift
//  VacationHistory
//
//  Created by Tim Van Dorpe on 19/08/18.
//  Copyright © 2018 Tim Van Dorpe. All rights reserved.
//

import UIKit
import MapKit
import RealmSwift

public class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var buildings : Results<Building>!
    
    var notificationToken : NotificationToken?
   
    public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let realm = RealmService.shared.realm
        
        buildings = realm.objects(Building.self)
        notificationToken = realm.observe{
            (notification, realm) in
            //TableViewController.tableView.reloadData()
        }
        RealmService.shared.observeRealmErrors(in: self) { (error) in
            //handle error
            print(error ?? "no error detected")
        }
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        NotificationCenter.default.addObserver(forName: BuildingsController.BUILDING_ADDED_NOTIFICATION, object: nil , queue: nil){notification in
            let newBuildingPin:MapPin = notification.object as! MapPin
            self.mapView.addAnnotation(newBuildingPin)
            
        }
            for(_, currentObject) in buildings.enumerated(){
                let building:Building = currentObject;
                let buildingPin:MapPin = MapPin(title: building.name , subtitle : building.desscription! , coordinate : CLLocationCoordinate2DMake(CLLocationDegrees(building.latitude), CLLocationDegrees(building.longitude)))
                mapView.addAnnotation(buildingPin)
                
            }
        
        //de map wordt overzichtelijker , 2000 span instellen
        let distanceSpan:CLLocationDegrees = 20000
        let startLocation:CLLocationCoordinate2D = LocationController.deviceLocation()
        //let startLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(CLLocationDegrees(51.05), CLLocationDegrees(3.7167))
        
            mapView.setRegion(MKCoordinateRegion.init(center: startLocation, latitudinalMeters: distanceSpan, longitudinalMeters: distanceSpan), animated: true)
        
     
    }
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mapView.reloadInputViews()
        self.viewDidLoad()
        
        
    }
   
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

