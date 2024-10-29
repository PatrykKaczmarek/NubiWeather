//
//  WelcomeCoordinator.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import Foundation

final class WelcomeCoordinator: ObservableObject {
        
    private let navigation: Navigation
    
    init(navigation: Navigation) {
        self.navigation = navigation
    }
    
    func enterLocation() {
        navigation.push(.enterLocationManually)
    }
    
    func useLocation() {
        navigation.push(.useMyLocation)
    }
}
