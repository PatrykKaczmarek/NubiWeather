//
//  NavigationDestination.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

enum NavigationDestination {
    case enterLocationManually
    case useMyLocation
    case weatherForecast(Location)
    case weatherDetails(Weather)
    
    var allowsToPop: Bool {
        switch self {
        case .enterLocationManually, .useMyLocation, .weatherDetails:
            true
        case .weatherForecast:
            false
        }
    }
}

extension NavigationDestination: Hashable {
    static func == (lhs: NavigationDestination, rhs: NavigationDestination) -> Bool {
        switch lhs {
        case .enterLocationManually:
            if case .enterLocationManually = rhs {
                return true
            }
            return false
        case .useMyLocation:
            if case .useMyLocation = rhs {
                return true
            }
            return false
        case .weatherForecast(let lhsLocation):
            guard case .weatherForecast(let rhsLocation) = rhs else {
                return false
            }
            return lhsLocation == rhsLocation
        case .weatherDetails(let lhsWeather):
            guard case .weatherDetails(let rhsWeather) = rhs else {
                return false
            }
            return lhsWeather == rhsWeather
        }
    }
}

import Foundation

/// TMP models:
struct Location: Hashable {
    let latitude: Double
    let longitude: Double
}

struct Weather: Hashable, Identifiable {
    var id: Date {
        date
    }
    let date: Date
    let temperatureMax: Double
    let temperatureMin: Double
    /// let description: String = "mostly sunny"
    let humidityAvg: Double
    let precipitationProbabilityAvg: Double
    let uvIndexAvg: Double
    let windSpeedMax: Double
    let visibilityAvg: Double
    let pressureSurfaceLevelAvg: Double
    let sunsetTime: Date
    let sunriseTime: Date
}
