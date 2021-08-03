//
//  BackgroundCityView.swift
//  Weather
//
//  Created by Diego Llopis on 22/07/21.
//

import SwiftUI

struct BackgroundCityView: View {
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(
                        colors: [Color.blue, Color("blueLightColor")]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                .ignoresSafeArea()
        }
    }
}

struct BackgroundCityView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundCityView()
    }
}
