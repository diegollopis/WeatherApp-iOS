//
//  CitiesScrollView.swift
//  Weather
//
//  Created by Diego Llopis on 27/07/21.
//

import SwiftUI

struct CitiesScrollView: View {
    
    @StateObject var controller: WeatherVM
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack (spacing: 10){
                
                ForEach(controller.searchBarData, id: \.self) { city in
                    
                    Button {
                        controller.fetchData(url: controller.getAPIURL(cityName: city))
                        
                    } label :{
                        Text(city)
                            .font(.system(size: 22.0))
                            .foregroundColor(.white)
                            .padding(15)
                    }
                    .background(Color("translucidBackground"))
                    .cornerRadius(25)
                }
            }
        }
        .animation(.easeInOut)
    }
}
