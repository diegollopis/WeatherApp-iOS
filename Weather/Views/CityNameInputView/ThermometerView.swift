//
//  ThermometerView.swift
//  Weather
//
//  Created by Diego Llopis on 22/07/21.
//

import SwiftUI

struct ThermometerView: View {
    
    var body: some View {
        
        Image(systemName: "thermometer.sun.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 250, height: 250)
    }
}
