//
//  WeatherForecastCoordinator.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import Foundation

final class WeatherForecastCoordinator: ObservableObject {
    @Published var currentCityName: String?
    @Published var uiState: UIState<[Weather]> = .unknown
    
    private let navigation: Navigation
    private let weatherService: WeatherService
    private let locationService: LocationService
    private let location: Location
    
    var isAutoLocated: Bool {
        location.autoLocated
    }
    
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
    
    func changeLocation() {
        navigation.route(to: .enterLocationManually)
    }
    
    func fetchWeather() {
        uiState = .loading
        Task { @MainActor in
            do {
                let weather = try await weatherService.fetchWeather(location: location)
                if weather.isEmpty {
                    uiState = .empty
                } else {
                    uiState = .data(weather)
                }
            } catch {
                uiState = .error
            }
        }
    }
}
