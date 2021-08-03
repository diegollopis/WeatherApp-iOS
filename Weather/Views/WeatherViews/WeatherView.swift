//
//  ContentView.swift
//  Weather
//
//  Created by Diego Llopis on 16/07/21.
//

import SwiftUI

struct WeatherView: View {
    
    @StateObject var weatherManager: WeatherVM
    
    var body: some View {
        
        ZStack {
            
            // MARK - BACKGROUND COLOR
            weatherManager.cityWeather.backgroundColor
                .ignoresSafeArea()
            
            VStack (alignment: .leading) {
                
                // MARK - NAVBAR BUTTONS
                NavButtons(controller: weatherManager)
                
                Spacer()
                
                // MARK - SEARCH HISTORY BAR
                CitiesScrollView(controller: weatherManager)

                Spacer()
                
                // MARK - CITY NAME AND CURRENT TIME
                CityDetails(controller: weatherManager)
                
                // MARK - CURRENT CITY WEATHER
                CityWeatherConditions(controller: weatherManager)
                
                Spacer()
                
                // MARK - WEATHER DETAILS (WIND, HUMIDITY AND CLOUDS)
                WeatherDetails(controller: weatherManager)
            }
            .padding(30)
            .foregroundColor(.white)
        }
    }
}


