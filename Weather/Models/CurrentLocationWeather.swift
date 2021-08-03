//
//  CurrentLocationWeather.swift
//  Weather
//
//  Created by Diego Llopis on 22/07/21.
//

import CoreLocation
import SwiftUI

class GetLocation: NSObject, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    var lastLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func start() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastLocation = locations.first?.coordinate
    }
}
