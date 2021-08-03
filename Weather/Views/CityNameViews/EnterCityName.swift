//
//  TextField.swift
//  Weather
//
//  Created by Diego Llopis on 27/07/21.
//

import SwiftUI

struct EnterCityName: View {
    
    @StateObject var controller: WeatherVM
    
    @State var cityName = ""
    
    var body: some View {
        
        HStack {
            TextField("Enter city name", text: $cityName)
                .padding(30)
                .font(Font.system(size: 25, weight: .light))
            
            Button {
                if cityName.count > 0 {
                    self.dismissKeyboard()
                    controller.fetchData(url: controller.getAPIURL(cityName: cityName))
                    cityName = ""
                }
            } label: {
                Image(systemName: "magnifyingglass")
                    .imageScale(.large)
                    .padding(.trailing, 20)
            }
        }
        .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.white, lineWidth: 3))
        .padding(30)
    }
}
