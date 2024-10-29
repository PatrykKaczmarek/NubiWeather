//
//  UseLocationCoordinator.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import Foundation

final class UseLocationCoordinator: ObservableObject {
    
    private let navigation: Navigation
    
    init(navigation: Navigation) {
        self.navigation = navigation
    }
    
    func confirmLocation() {
        let location = Location(latitude: 52.409538, longitude: 16.931992)
        navigation.push(.weatherForecast(location))
    }
}
