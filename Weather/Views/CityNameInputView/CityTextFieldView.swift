//
//  CityTextFieldView.swift
//  Weather
//
//  Created by Diego Llopis on 22/07/21.
//

import SwiftUI

struct CityTextFieldView: View {
    
    @StateObject var weatherManager: WeatherVM
    
    @Binding var cityName: String
    
    @Binding var isShowingWeatherView: Bool
    
    var body: some View {
        
        HStack {
            
            TextField("Enter city name", text: $cityName)
                .padding(30)
                .font(Font.system(size: 25, weight: .light))
                
            Button {
                if cityName.count > 0 {
                    
                    performAction()
                    
                    self.dismissKeyboard()
                }
                
            } label: {
                Image(systemName: "magnifyingglass")
                    .padding(20)
                    .imageScale(.large)
            }
        }
        .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.white, lineWidth: 3))
    }
    
    func performAction() {
        
        let url = weatherManager.getAPIURL(cityName: cityName)
        
        weatherManager.fetchData(url: url)
        
        cityName = ""
        
        isShowingWeatherView.toggle()
    }
}
