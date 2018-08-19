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
class BuildingsController:NSObject{
    public static let BUILDING_ADDED_NOTIFICATION = NSNotification.Name("Building Added")
    
    static var buildingsArray:Array = Array<MapPin>()
    //static let buildingPinClassName:String = String(describing: MapPinModel.self)
    
    class func sharedBuildings() -> Array<Any>{
        
        return buildingsArray
    }
    
    class func addBuilding( building : MapPin){
        BuildingsController.buildingsArray.insert(building, at: 0)
        self.buildingsArray = self.buildingsArray.sorted(by: { $0.title.lowercased() < $1.title.lowercased() })
        
    
        
        NotificationCenter.default.post(name : BUILDING_ADDED_NOTIFICATION , object: building)
    }
    class func loadbuildings(){
        let newMapPin:MapPin = MapPin(title: "first mappin" , subtitle: "This is the first mappin" , coordinate:LocationController.deviceLocation())
        self.addBuilding(building: newMapPin)
    }
    
}
