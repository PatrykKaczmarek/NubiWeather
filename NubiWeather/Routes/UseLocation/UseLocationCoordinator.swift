//
//  UseLocationCoordinator.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import Foundation

final class UseLocationCoordinator: ObservableObject {
    private(set) var locationService: LocationService
    private let navigation: Navigation
    
    init(navigation: Navigation, locationService: LocationService) {
        self.navigation = navigation
        self.locationService = locationService
    }
    
    func confirmLocation() {
        guard let currentCoreLocation = locationService.fetchLocation() else { return }
        let location = Location(
            latitude: currentCoreLocation.latitude,
            longitude: currentCoreLocation.longitude,
            autoLocated: true
        )
        navigation.push(.weatherForecast(location))
    }
    
    func requestLocationAuthorization() {
        locationService.requestAuthorization()
    }
    
    func verifyServices() async  {
        await locationService.verifyServices()
    }
}
