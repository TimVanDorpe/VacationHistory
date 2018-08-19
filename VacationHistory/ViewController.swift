//
//  ViewController.swift
//  VacationHistory
//
//  Created by Tim Van Dorpe on 19/08/18.
//  Copyright © 2018 Tim Van Dorpe. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(forName: BuildingsController.BUILDING_ADDED_NOTIFICATION, object: nil , queue: nil){notification in
            let newBuildingPin:MapPin = notification.object as! MapPin
            self.mapView.addAnnotation(newBuildingPin)
            
            
        }
        
        let buildingsArray:Array = BuildingsController.sharedBuildings()
        for(_, currentObject) in buildingsArray.enumerated(){
            let buildingPin:MapPin = currentObject as! MapPin
            
            mapView.addAnnotation(buildingPin)
        }
        let distanceSpan:CLLocationDegrees = 2000
        let startLocation:CLLocationCoordinate2D = LocationController.deviceLocation()
        if(startLocation != nil){
            mapView.setRegion(MKCoordinateRegionMakeWithDistance(startLocation, distanceSpan, distanceSpan), animated: true)
        }
        //        let buildingsArray = BuildingsController.sharedBuildings()
        //
        //        for currentObject in buildingsArray.enumerated(){
        //            let currentPin = currentObject as! MapPin
        //            mapView.addAnnotation(currentPin)
        //        }
        
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

