//
//  dismisskeyboard.swift
//  Weather
//
//  Created by Diego Llopis on 20/07/21.
//

import SwiftUI

extension View {
    func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
