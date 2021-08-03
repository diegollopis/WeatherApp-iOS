//
//  Background.swift
//  Weather
//
//  Created by Diego Llopis on 27/07/21.
//

import SwiftUI

struct WeatherBackground: View {
    
    var body: some View {
        
        LinearGradient(gradient: Gradient(colors: [.green, Color("TealColor")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
    }    
}
