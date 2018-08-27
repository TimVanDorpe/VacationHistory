//
//  BuildingsController.swift
//  VacationHistory
//
//  Created by Tim Van Dorpe on 19/08/18.
//  Copyright © 2018 Tim Van Dorpe. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit
import CoreData
import RealmSwift


class BuildingsController:NSObject{
    public static let BUILDING_ADDED_NOTIFICATION = NSNotification.Name("Building Added")
   // var buildings:Results<Building> = ViewController.getBuildings()
    
    
    
    //static var buildingsArray:Array = Array<Building>()
    //static let buildingPinClassName:String = String(describing: MapPinModel.self)
    
    
    
    
    /*class func sharedBuildings() -> Array<Any>{
         self.buildingsArray = self.buildingsArray.sorted(by: { $0.name.lowercased() < $1.name.lowercased() })
        return self.buildingsArray
    }
    
    class func addBuilding( building : Building){
        
        BuildingsController.buildingsArray.insert(building, at: 0)
        self.buildingsArray = self.buildingsArray.sorted(by: { $0.name.lowercased() < $1.name.lowercased() })
        let mappin = MapPin(title : building.name , subtitle : building.desscription! , coordinate : CLLocationCoordinate2DMake(building.latitude, building.latitude))
        NotificationCenter.default.post(name : BUILDING_ADDED_NOTIFICATION , object: mappin)
        RealmService.shared.create(building)
        
    }*/
    /*class func loadbuildings(){
        for(_, currentObject) in buildings.enumerated(){
            let building:Building = currentObject as! Building
            self.addBuilding(building: building)
        }
        
        //buildingsArray = Array(buildings)
        //eerste test mappin
        let newMapPin:MapPin = MapPin(title: "first mappin" , subtitle: "This is the first mappin" , coordinate:LocationController.deviceLocation())
        //self.addBuilding(building: newMapPin)
        let newBuilding:Building = Building(name: "test" , desscription : "Test", latitude : Double(newMapPin.coordinate.latitude), longitude : Double(newMapPin.coordinate.longitude))
        self.addBuilding(building: newBuilding)
    }*/
    
}
