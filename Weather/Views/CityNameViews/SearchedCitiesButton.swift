//
//  SearchedCitiesButton.swift
//  Weather
//
//  Created by Diego Llopis on 27/07/21.
//

import SwiftUI

struct SearchedCitiesButton: View {
    
    @StateObject var controller: WeatherVM
    
    var body: some View {
        
        HStack {

            Button {
                self.dismissKeyboard()
                if controller.searchBarData.count > 0 {
                    controller.fetchData(url: controller.getAPIURL(cityName: controller.searchBarData[0]))
                } else {
                    controller.isShowingErrorAlert = true
                }
                
            } label: {
                HStack {
                    Image(systemName: "magnifyingglass.circle.fill")
                        .imageScale(.small)
                    Text("Searched")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.horizontal, -5)
                }
            }
            Spacer()
        }
        .foregroundColor(controller.isShowingLoadingView ? Color.clear : Color.white)
        .padding(30)
    }
}

struct NavButtonLabelView: View {
    
    let iconName: String
    let label: String
    
    var body: some View {
        
        HStack {
            Image(systemName: iconName)
                .imageScale(.small)
            Text(label)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .padding(.horizontal, -5)
        }
    }
}
