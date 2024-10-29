//
//  EnterLocationCoordinator.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import Foundation

final class EnterLocationCoordinator: ObservableObject {
    
    @Published var location = String()
    
    private let navigation: Navigation
    
    init(navigation: Navigation) {
        self.navigation = navigation
    }
    
    func confirmLocation() {
        navigation.push(.weatherForecast)
    }
}
