//
//  InfoAPI.swift
//  Weather
//
//  Created by Diego Llopis on 03/08/21.
//

struct NetworkManager {
    
    func cityURL() -> String {
        "https://api.openweathermap.org/data/2.5/weather?units=metric&APPID=\(APIKey.value)"
    }
    
    func currentLocationURL(latitude: Double, longitude: Double) -> String {
        "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(APIKey.value)&units=metric"
    }
}
