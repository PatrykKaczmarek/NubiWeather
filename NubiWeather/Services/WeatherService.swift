//
//  WeatherService.swift
//  NubiWeather
//
//  Created by Patryk on 30/10/2024.
//

import Shared

final class WeatherService {
    enum Error: Swift.Error {
        case missingAppId
    }
    private let platformFileStore = PlatformFileStore()
    private let platformSettingStore = PlatformSettingStore()
    private let client: WeatherClient
    
    init() throws {
        var config: [String: Any] = [:]
        try AppConfig.read(into: &config)
        
        guard let appId = config.apiAppId else {
            throw Error.missingAppId
        }
        
        client = WeatherClient(
            appId: appId,
            platformFileStore: platformFileStore,
            platformSettingStore: platformSettingStore
        )
        
    }
    
    func fetchWeather(location: Location) async throws -> [Weather] {
        let response = try await client.requestWeatherForecast(
            latitude: location.latitude,
            longitude: location.longitude,
            units: .metric,
            cachePolicy: .companion.DEFAULT
        )
        
        let data = response.weatherForecast
        guard let daily: [TimelineItem<DataValuesDaily>] = data?.timelines.daily, !daily.isEmpty else {
            return []
        }
        
        var weather: [Weather] = []
        daily.forEach { day in
            if let values = day.values {
                
                weather.append(
                    Weather(
                        date: Date(instant: day.time),
                        temperatureMax: values.temperatureMax,
                        temperatureMin: values.temperatureMin,
                        condition: {
                            /// Workaround for having user displayable string.
                            guard let rawName = values.weatherMin?.name ?? values.weatherMax?.name else {
                                return nil
                            }
                            let components = rawName.components(separatedBy: "_")
                            return components.joined(separator: " ").capitalized
                        }(),
                        humidityAvg: values.humidityAvg,
                        precipitationProbabilityAvg: values.precipitationProbabilityAvg,
                        uvIndexMin: values.uvIndexMin.flatMap { Int(truncating: $0) },
                        windSpeedMax: values.windSpeedMax,
                        visibilityAvg: values.visibilityAvg,
                        pressureSurfaceLevelAvg: values.pressureSurfaceLevelAvg,
                        sunsetDate: values.sunsetTime.flatMap { Date(instant: $0) },
                        sunriseDate: values.sunriseTime.flatMap { Date(instant: $0) }
                    )
                )
            }
        }
        return weather
    }
}

private extension Response<WeatherForecast> {
    var weatherForecast: WeatherForecast? {
        switch self {
        case let response as ResponseSuccess<WeatherForecast>:
            return response.data
        case let response as ResponseFromCache<WeatherForecast>:
            return response.data
        default:
            return nil
        }
    }
}

private extension Date {
    init(instant: Kotlinx_datetimeInstant) {
        self = Date(timeIntervalSince1970: TimeInterval(instant.epochSeconds))
    }
}
