//
//  LocationService.swift
//  NubiWeather
//
//  Created by Michał Gałęziowski on 30/10/2024.
//

import Foundation
import CoreLocation

final class LocationService: NSObject, ObservableObject {
    private let manager = CLLocationManager()
    
    @Published var isLocationPermissionGranted: Bool = false
    @Published var isLocationServiceEnabled: Bool = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    @MainActor func verifyServices() {
        verifyPermission()
        verifyLocationService()

    }
    
    func requestAuthorization() {
        manager.requestWhenInUseAuthorization()
    }
    
    private func verifyLocationService() {
        Task.detached { [weak self] in
            let status = await self?.locationServicesEnabled() ?? false
            
            Task { @MainActor in
                self?.isLocationServiceEnabled = status
                
            }
        }
    }
    
    @MainActor
    private func verifyPermission() {
        isLocationPermissionGranted = manager.authorizationStatus == .authorizedAlways
        || manager.authorizationStatus == .authorizedWhenInUse
    }
    
    private func locationServicesEnabled() async -> Bool {
        CLLocationManager.locationServicesEnabled()
    }
}

extension LocationService: @preconcurrency CLLocationManagerDelegate {
    @MainActor func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        verifyServices()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("LOCATION ERROR: \(error.localizedDescription)")
    }
}
