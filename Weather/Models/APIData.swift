//
//  WeatherData.swift
//  Weather
//
//  Created by Diego Llopis on 16/07/21.
//

import Foundation

struct APIData: Codable {
    
    let name: String
    let sys: Sys
    let timezone: Int
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let clouds: Clouds
}

struct Weather: Codable {
    
    let id: Int
    let description: String
}

struct Main: Codable {
    
    let temp: Double
    let humidity: Int
}

struct Wind: Codable {
    
    let speed: Double
}

struct Sys: Codable {
    
    let country: String
    let sunrise: Int
    let sunset: Int
}

struct Clouds: Codable {
    
    let all: Int
}

