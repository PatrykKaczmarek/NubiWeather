//
//  EnterLocationCoordinator.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import Foundation

final class EnterLocationCoordinator: ObservableObject {
    
    @Published var location = String()
    
    private let locationService: LocationService
    private let navigation: Navigation
    
    init(navigation: Navigation, locationService: LocationService) {
        self.navigation = navigation
        self.locationService = locationService
    }
    
    func confirmLocation() {
        Task { @MainActor in
            guard let cityCoordinates = try await locationService.getLocation(from: location) else {
                return
            }
            let location = Location(latitude: cityCoordinates.latitude, longitude: cityCoordinates.longitude)
            navigation.push(.weatherForecast(location))
        }
    }
}
