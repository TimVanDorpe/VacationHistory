//
//  MapPin.swift
//  VacationHistory
//
//  Created by Tim Van Dorpe on 19/08/18.
//  Copyright © 2018 Tim Van Dorpe. All rights reserved.
//

import Foundation
import MapKit
import RealmSwift

@objcMembers class Building: Object{
    dynamic var name: String! = ""
    dynamic var desscription: String? = nil
    dynamic var latitude: Double = 0
    dynamic var longitude: Double = 0
    
    convenience init(name:String, desscription:String, latitude:Double , longitude:Double) {
        self.init()
        self.name = name
        self.desscription = description
        self.longitude = longitude
        self.latitude = latitude
    }
    class func toMapPin() -> MapPin{
        return MapPin(title : "test" , subtitle : "test" , coordinate : CLLocationCoordinate2DMake(0, 0))
        /*return MapPin(title: self.name! , subtitle: self.desscription!, coordinate: CLLocationCoordinate2DMake(CLLocationDegrees(self.latitude), CLLocationDegrees(self.longitude)))*/
    }
}

