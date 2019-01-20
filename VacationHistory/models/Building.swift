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
    dynamic var date: String! = ""
    dynamic var countPhotos: Int = 0
    dynamic var rating : Int = 0
    dynamic var pathPhoto : String = ""
    
    convenience init(name:String, desscription:String, latitude:Double , longitude:Double) {
        self.init()
        self.name = name
        self.desscription = desscription
        self.longitude = longitude
        self.latitude = latitude
        self.date = getTodayString()
        self.rating = 0
        self.countPhotos = 0
        self.pathPhoto = ""
    
        
       
    }
    
    func getTodayString() -> String{
        
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        
        let year = components.year
        let month = components.month
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        _ = components.second
        
        let today_string = String(day!) + "/" + String(month!) + "/" + String(year!) + " at " +
            String(hour!)  + ":" + String(minute!)
       
        print(today_string)
        
        return today_string
        
    }
}


