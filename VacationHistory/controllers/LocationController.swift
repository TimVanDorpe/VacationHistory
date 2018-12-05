//
//  LocationController.swift
//  VacationHistory
//
//  Created by Tim Van Dorpe on 19/08/18.
//  Copyright © 2018 Tim Van Dorpe. All rights reserved.
//

import Foundation
import CoreLocation

class LocationController:NSObject, CLLocationManagerDelegate{
    
    static var currentLocation:CLLocation? = nil
    static let locationManager:CLLocationManager = CLLocationManager()
    
    static var sharedLocationController:LocationController = LocationController()
    
    class func startGPS(){
        locationManager.delegate = sharedLocationController
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
        locationManager.requestAlwaysAuthorization()
        
    }
    
    class func stopGPS(){
        locationManager.stopUpdatingLocation()
        
    }
    class func deviceLocation() -> CLLocationCoordinate2D{
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = sharedLocationController
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        if(currentLocation != nil){
            return (currentLocation?.coordinate)!}
        else{
            return CLLocationCoordinate2DMake(0.0, 0.0)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        
       LocationController.currentLocation = locations[0]
    }
}
