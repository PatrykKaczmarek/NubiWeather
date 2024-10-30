//
//  WeatherForecastCoordinator.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import Foundation
import Combine
import CoreLocation

final class WeatherForecastCoordinator: ObservableObject {    
    @Published var currentCityName: String?
    @Published var weather: [Weather] = []
    
    //private let service = WeatherService()
    private var lastKnownLocationListener: AnyCancellable?
    
    private let navigation: Navigation
    private let locationService: LocationService
    private let location: Location?
    
    init(
        navigation: Navigation,
        locationService: LocationService,
        location: Location?
    ) {
        self.navigation = navigation
        self.locationService = locationService
        self.location = location
        
        Task { @MainActor in
            currentCityName = try await locationService.geoDeocode(location)
        }
    }
    
    func showForecastDetails(weather: Weather) {
        navigation.push(.weatherDetails(weather))
    }
    
    func fetchWeather(location: Location) {
        
        //service.fetchWeather(location: location)
    }
}
