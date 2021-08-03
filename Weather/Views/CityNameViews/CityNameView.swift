//
//  TextFieldView.swift
//  Weather
//
//  Created by Diego Llopis on 19/07/21.
//

import SwiftUI

struct CityNameView: View {
    
    @StateObject var weatherManager: WeatherVM
    
    var body: some View {
        
        ZStack {
            
            WeatherBackground()
            
            VStack {
        
                SearchedCitiesButton(controller: weatherManager)
                
                LargeScaleIcon()
                
                EnterCityName(controller: weatherManager)
                
                Spacer()
                
                if weatherManager.isShowingLoadingView {
                    LoadingAnimationView()
                }
                Spacer()
            }
        }
        .foregroundColor(.white)
        .ignoresSafeArea(.keyboard)
        .alert(isPresented: $weatherManager.isShowingErrorAlert, content: { showErrorAlert() })
        .onTapGesture {
            self.dismissKeyboard()
        }
    }
    
    func showErrorAlert() -> Alert {
        Alert(
            title: Text("Error!"),
            message: Text("An error has occurred. Try again."),
            dismissButton: .default(Text("OK"))
        )
    }
}
