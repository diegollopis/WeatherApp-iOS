//
//  NavButtons.swift
//  Weather
//
//  Created by Diego Llopis on 27/07/21.
//

import SwiftUI

struct NavButtons: View {
    
    @StateObject var controller: WeatherVM
    
    var body: some View {
        
        HStack {
            
            Button {
                controller.isShowingWeatherView = false

            } label: {
                Image(systemName: "arrowshape.turn.up.backward.fill")
                    .imageScale(.large)
                    .padding(10)
            }
            
            Spacer()
            
            Button {
                controller.fetchLocalWeather(current: controller)
                
            } label: {
                NavButtonLabelView(iconName: "location.fill", label: "Your place")
                    .padding(10)
            }
        }
        .foregroundColor(controller.isShowingLoadingView ? Color.clear : Color.white)
    }
}
