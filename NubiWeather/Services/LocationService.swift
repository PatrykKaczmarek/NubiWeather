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
    @Published var lastKnownLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    @MainActor func verifyServices() {
        verifyPermission()
        verifyLocationService()
    }
    
    
    /// To simplify we return only city name
    func geoDeocode(_ coordinates: Location?) async throws -> String?  {
        guard let coordinates else { return nil }
        let geocoder = CLGeocoder()
        
        guard let placemark = try await geocoder.reverseGeocodeLocation(
            CLLocation(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude
            )
        ).first else {
            return nil
        }
        
        return placemark.locality
    }
    
    /// Return location from city name
    func getLocation(from cityName: String) async throws -> Location? {
        let geocoder = CLGeocoder()
        guard let placemark = try await geocoder.geocodeAddressString(cityName).first else { return nil }
        guard let coordinates = placemark.location?.coordinate else { return nil }
        return Location(latitude: coordinates.latitude, longitude: coordinates.longitude, autoLocated: true)
    }
    
    func requestAuthorization() {
        manager.requestWhenInUseAuthorization()
    }
    
    func fetchLocation() -> CLLocationCoordinate2D? {
        manager.requestLocation()
        return manager.location?.coordinate
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
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastKnownLocation = locations.first?.coordinate
    }
}
