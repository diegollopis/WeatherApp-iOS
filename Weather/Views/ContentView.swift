//
//  ContentView.swift
//  Weather
//
//  Created by Diego Llopis on 21/07/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherManager = WeatherVM()

    @State private var cityName = ""
    
    init() {
        weatherManager.location.start()
    }
    
    var body: some View {
        
        CityNameView(weatherManager: weatherManager)
            .sheet(isPresented: $weatherManager.isShowingWeatherView, content: {WeatherView(weatherManager: weatherManager)})
    }
}
