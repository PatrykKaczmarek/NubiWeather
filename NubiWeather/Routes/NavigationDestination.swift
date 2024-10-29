//
//  NavigationDestination.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

enum NavigationDestination {
    case enterLocationManually
    case useMyLocation
    case weatherForecast
    case weatherDetails
    
    var allowsToPop: Bool {
        switch self {
        case .enterLocationManually, .useMyLocation, .weatherDetails:
            true
        case .weatherForecast:
            false
        }
    }
}
