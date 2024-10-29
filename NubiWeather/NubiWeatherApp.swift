//
//  NubiWeatherApp.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import SwiftUI

@main
struct NubiWeatherApp: App {
    
    @State var location = String()
    
    var body: some Scene {
        WindowGroup {
            EnterLocationView(location: location, confirmation: {})
        }
    }
}
