//
//  NubiWeatherApp.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import SwiftUI

@main
struct NubiWeatherApp: App {
    var body: some Scene {
        WindowGroup {
            WelcomeView(onEnterLocation: {}, onUseLocation: {})
        }
    }
}
