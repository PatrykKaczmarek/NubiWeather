//
//  WeatherForecastCoordinator.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import Foundation

final class WeatherForecastCoordinator: ObservableObject {    
    @Published var currentCityName: String?
    @Published var weather: [Weather] = []
    
    private let navigation: Navigation
    private let weatherService: WeatherService
    private let locationService: LocationService
    private let location: Location
    
    init(
        navigation: Navigation,
        locationService: LocationService,
        weatherService: WeatherService,
        location: Location
    ) {
        self.navigation = navigation
        self.locationService = locationService
        self.weatherService = weatherService
        self.location = location
        
        Task { @MainActor in
            currentCityName = try await locationService.geoDeocode(location)
        }
    }
    
    func showForecastDetails(weather: Weather) {
        navigation.push(.weatherDetails(weather))
    }
    
    func fetchWeather() {
        Task { @MainActor in
            do {
                weather = try await weatherService.fetchWeather(location: location)
            } catch {
                // Handle error
            }
        }
    }
}
