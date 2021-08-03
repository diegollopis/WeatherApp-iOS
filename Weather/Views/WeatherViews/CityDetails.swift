//
//  CityDetails.swift
//  Weather
//
//  Created by Diego Llopis on 27/07/21.
//

import SwiftUI

struct CityDetails: View {
    
    @StateObject var controller: WeatherVM
    
    var body: some View {
        
        VStack (alignment: .leading ) {
            
            Text("\(controller.cityWeather.name), \(controller.cityWeather.country)")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .scaledToFit()
                .minimumScaleFactor(0.5)
            
            Text("\(controller.cityWeather.currentTimeString)  -  \(controller.cityWeather.currentDateString)")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .padding(.top, 5)
        }
    }
}
