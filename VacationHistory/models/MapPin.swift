
//
//  MapPin.swift
//  VacationHistory
//
//  Created by Tim Van Dorpe on 19/08/18.
//  Copyright © 2018 Tim Van Dorpe. All rights reserved.
//
import Foundation
import MapKit
class MapPin: NSObject, MKAnnotation {
    var title: String!
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    init(title:String, subtitle:String, coordinate:CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
