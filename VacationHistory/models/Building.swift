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
    dynamic var desscription: String? 
    dynamic var latitude: Double = 0
    dynamic var longitude: Double = 0
    
    convenience init(name:String, desscription:String, latitude:Double , longitude:Double) {
        self.init()
        self.name = name
        self.desscription = desscription
        self.longitude = longitude
        self.latitude = latitude
    }
    
}

