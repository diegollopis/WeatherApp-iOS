//
//  LoadingDataView.swift
//  Weather
//
//  Created by Diego Llopis on 25/07/21.
//

import SwiftUI

struct LoadingAnimationView: View {
    
    @State private var isLoading = false
    
    var body: some View {
        
        ZStack {
            
            Circle()
                .trim(from: 0, to: 0.2)
                .stroke(Color.white, lineWidth: 7)
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                .onAppear() {
                    self.isLoading = true
                }
        }
    }
}
