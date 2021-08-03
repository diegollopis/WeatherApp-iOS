//
//  WeatherDetails.swift
//  Weather
//
//  Created by Diego Llopis on 27/07/21.
//

import SwiftUI

struct WeatherDetails: View {
    
    @StateObject var controller: WeatherVM
    
    var body: some View {
        
        HStack {
            WeatherSingleDetailView(name: "Wind", value: controller.cityWeather.windSpeed, unit: "km/h")
            Spacer()
            WeatherSingleDetailView(name: "Humidity", value: Double(controller.cityWeather.humidity), unit: "%")
            Spacer()
            WeatherSingleDetailView(name: "Clouds", value: Double(controller.cityWeather.clouds), unit: "%")
        }
        .padding(.horizontal, 30)
    }
}

struct WeatherSingleDetailView: View {
    
    let name: String
    let value: Double
    let unit: String
    
    var body: some View {
        
        VStack {
            
            Text(name)
                .padding(.bottom, 10)
            
            Text("\(value, specifier: "%.1f")")
                .font(.system(size: 30))
                .fontWeight(.bold)
            
            Text(unit)
                
        }
        .foregroundColor(.white)
        .font(.system(size: 20))
    }
}
