//
//  UseLocationCoordinator.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import Foundation

final class UseLocationCoordinator: ObservableObject {
    private let locationService: LocationService
    private let navigation: Navigation
    
    var isLocationServiceEnabled: Bool {
        locationService.isLocationServiceEnabled
    }
    
    var isLocationPermissionGranted: Bool {
        locationService.isLocationPermissionGranted
    }
    
    init(navigation: Navigation, locationService: LocationService) {
        self.navigation = navigation
        self.locationService = locationService
    }
    
    func confirmLocation() {
        guard let currentCoreLocation = locationService.fetchLocation() else { return }
        let location = Location(latitude: currentCoreLocation.latitude, longitude: currentCoreLocation.longitude)
        navigation.push(.weatherForecast(location))
    }
    
    func requestLocationAuthorization() {
        locationService.requestAuthorization()
    }
    
    func verifyServices() async  {
        await locationService.verifyServices()
    }
}
