//
//  WeatherForecastCoordinator.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import Foundation

final class WeatherForecastCoordinator: ObservableObject {
    
    @Published var weather: [Weather] = []
    
    //private let service = WeatherService()
    
    private let navigation: Navigation
    
    init(navigation: Navigation) {
        self.navigation = navigation
    }
    
    func showForecastDetails(weather: Weather) {
        navigation.push(.weatherDetails(weather))
    }
    
    func fetchWeather(location: Location) {
        //service.fetchWeather(location: location)
    }
}
