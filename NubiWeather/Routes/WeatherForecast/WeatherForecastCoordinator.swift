//
//  WeatherForecastCoordinator.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import Foundation

final class WeatherForecastCoordinator: ObservableObject {
    
    private let navigation: Navigation
    
    init(navigation: Navigation) {
        self.navigation = navigation
    }
    
    func showForecastDetails() {
        navigation.push(.weatherDetails)
    }
}