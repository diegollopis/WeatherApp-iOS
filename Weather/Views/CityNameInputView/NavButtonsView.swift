//
//  CloseButtonView.swift
//  Weather
//
//  Created by Diego Llopis on 22/07/21.
//

import SwiftUI

struct NavButtonsView: View {
    
    @StateObject var weatherManager: WeatherVM
    
    @Binding var isShowingWeatherView: Bool
    
    var body: some View {
        
        HStack {
            
            Button {
                
                isShowingWeatherView.toggle()
                weatherManager.fetchLocalWeather(current: weatherManager)

            } label: {
                
                HStack {
                    Image(systemName: "location.fill")
                        .imageScale(.small)
                    Text("Go local")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.horizontal, -5)
                }
            }
            
            Spacer()
            
            Button {
                
                isShowingWeatherView.toggle()
                
            } label: {
                
                HStack {
                    Image(systemName: "magnifyingglass.circle.fill")
                        .imageScale(.small)
                    Text("Visited places")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.horizontal, -5)
                }
            }
        }
        .padding(.top, 20)
    }
}
