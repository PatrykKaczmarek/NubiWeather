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
    let uvIndexMin: Int?
    let windSpeedMax: Double
    let visibilityAvg: Double
    let pressureSurfaceLevelAvg: Double
    let sunsetDate: Date?
    let sunriseDate: Date?
}

extension Weather {
    var displayDate: String {
        DateFormatters.simpleDateFormatter.string(from: date)
    }
    
    var dayName: String {
        if Calendar.current.isDateInToday(date) {
            return "Today"
        } else if Calendar.current.isDateInTomorrow(date) {
            return "Tomorrow"
        } else {
            return DateFormatters.dayDateFormatter.string(from: date)
        }
    }
    
    var sunriseTime: String? {
        sunriseDate.flatMap {
            DateFormatters.timeFormatter.string(from: $0)
        }
    }
    
    var sunsetTime: String? {
        sunsetDate.flatMap {
            DateFormatters.timeFormatter.string(from: $0)
        }
    }
}
