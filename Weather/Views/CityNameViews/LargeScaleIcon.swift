//
//  LargeScaleIcon.swift
//  Weather
//
//  Created by Diego Llopis on 27/07/21.
//

import SwiftUI

struct LargeScaleIcon: View {
    
    var body: some View {
        
        Image(systemName: "thermometer.sun.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 180, height: 180)
            .padding(EdgeInsets(top: 60, leading: 0, bottom: 40, trailing: 0))
    }
}
