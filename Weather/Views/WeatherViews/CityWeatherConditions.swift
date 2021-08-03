//
//  CityWeatherConditions.swift
//  Weather
//
//  Created by Diego Llopis on 27/07/21.
//

import SwiftUI

struct CityWeatherConditions: View {
    
    @StateObject var controller: WeatherVM
    
    var body: some View {
        
        HStack {
            
            Text("\(controller.cityWeather.temp, specifier: "%.0f")°")
                .font(.system(size: 120))
                .fontWeight(.bold)
                .padding(.top, 20)
            
            if controller.isShowingLoadingView {
                LoadingAnimationView()
                    .padding(EdgeInsets(top: 30, leading: 30, bottom: 0, trailing: 0))
            }
        }
       
        HStack {
            Image(systemName: controller.cityWeather.conditionImage)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            
            Text((controller.cityWeather.weatherDescription).capitalized)
                .font(.system(size: 25))
                .fontWeight(.bold)
                .padding(.horizontal, 8)
        }
        .padding(.top, -10)
    }
}
