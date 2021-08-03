//
//  CityWeather.swift
//  Weather
//
//  Created by Diego Llopis on 16/07/21.
//

import SwiftUI

struct WeatherModel {
    
    let name: String
    let country: String
    let timezone: Double
    let conditionID: Int
    let temp: Double
    let weatherDescription: String
    let sunrise: Int
    let sunset: Int
    let windSpeed: Double
    let humidity: Int
    let clouds: Int
    
    var currentDate: Date {
        DateClass.getCurrentDate(timezone: timezone)
    }
    
    var sunriseTime: Date {
        DateClass.getSunTime(sunTime: sunrise, timezone: timezone)
    }
   
    var sunsetTime: Date {
        DateClass.getSunTime(sunTime: sunset, timezone: timezone)
    }
   
    var currentTimeString: String {
        return DateClass.getDateDetailsString(string: "HH:mm", timezone: timezone)
    }
    
    var currentDateString: String {
        return DateClass.getDateDetailsString(string: "dd/MM/YYYY", timezone: timezone)
    }
    
    var dayLight: Bool {
        return (currentDate > sunriseTime) && (currentDate < sunsetTime)
    }
    
    var backgroundColor: LinearGradient {
        
        if dayLight  {
            return LinearGradient(gradient: Gradient(colors: [.blue, Color("blueLightColor")]), startPoint: .top, endPoint: .bottom)
        } else {
            return LinearGradient(gradient: Gradient(colors: [Color.black, Color("blackLightColor")]), startPoint: .top, endPoint: .bottom)
        }
    }
    
    var conditionImage: String {
        switch (conditionID, dayLight) {
        case (200...232, true):
            return "cloud.bolt.fill"
        case (300...321, true):
            return "cloud.drizzle.fill"
        case (500...504, true):
            return "cloud.sun.rain.fill"
        case (511, true):
            return "cloud.snow.fill"
        case (520...531, true):
            return "cloud.rain.fill"
        case (600...622, true):
            return "snowflake"
        case (701...781, true):
            return "cloud.fog.fill"
        case (800, true):
            return "sun.max.fill"
        case (801, true):
            return "cloud.sun.fill"
        case (802...804, true):
            return "cloud.fill"
        case (200...232, false):
            return "cloud.bolt.fill"
        case (300...321, false):
            return "cloud.drizzle.fill"
        case (500...504, false):
            return "cloud.moon.rain.fill"
        case (511, false):
            return "cloud.snow.fill"
        case (520...531, false):
            return "cloud.rain.fill"
        case (600...622, false):
            return "snowflake"
        case (701...781, false):
            return "cloud.fog.fill"
        case (800, false):
            return "moon.stars.fill"
        case (801, false):
            return "cloud.moon.fill"
        case (802...804, false):
            return "cloud.fill"
        default:
            return "cloud.fill"
        }
    }
}

