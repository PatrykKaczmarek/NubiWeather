//
//  WeatherForecastRow.swift
//  NubiWeather
//
//  Created by Michał Gałęziowski on 30/10/2024.
//

import SwiftUI

struct WeatherForecastRow: View {
    let weather: Weather
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(weather.dayName)
                .titleStyle()
            Text(weather.displayDate)
                .bodyStyle()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.nubiWhite, lineWidth: 0.4)
        )
    }
}

fileprivate extension Weather {
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
}

#Preview {
    WeatherForecastRow(
        weather: .init(
            date: .distantPast,
            temperatureMax: 0,
            temperatureMin: 0,
            condition: "Cloudy all day",
            humidityAvg: 0,
            precipitationProbabilityAvg: 0,
            uvIndexAvg: 0,
            windSpeedMax: 0,
            visibilityAvg: 0,
            pressureSurfaceLevelAvg: 0,
            sunsetTime: .distantFuture,
            sunriseTime: .distantPast
        )
    )
}
