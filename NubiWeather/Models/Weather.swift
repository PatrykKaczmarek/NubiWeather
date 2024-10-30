//
//  Weather.swift
//  NubiWeather
//
//  Created by Patryk on 30/10/2024.
//

import Foundation

struct Weather: Hashable, Identifiable {
    var id: Date {
        date
    }
    let date: Date
    let temperatureMax: Double
    let temperatureMin: Double
    let condition: String?
    let humidityAvg: Double
    let precipitationProbabilityAvg: Double
    let uvIndexAvg: Int?
    let windSpeedMax: Double
    let visibilityAvg: Double
    let pressureSurfaceLevelAvg: Double
    let sunsetTime: Date?
    let sunriseTime: Date?
}
