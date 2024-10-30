//
//  AppServices.swift
//  NubiWeather
//
//  Created by Patryk on 30/10/2024.
//

final class AppServices {
    let locationService = LocationService()
    
    lazy var weatherService: WeatherService? = {
        do {
            return try WeatherService()
        } catch {
            print(error)
            return nil
        }
    }()
}
