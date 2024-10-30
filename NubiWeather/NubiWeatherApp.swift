//
//  NubiWeatherApp.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import SwiftUI

@main
struct NubiWeatherApp: App {
    
    private let services = AppServices()
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(resource: .nubiWhite)]
    }
    
    @State private var path: [NavigationDestination] = []
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $path) {
                WelcomeView(coordinator: WelcomeCoordinator(navigation: self))
                    .navigationDestination(for: NavigationDestination.self) { destination in
                        view(for: destination)
                            .navigationBarBackButtonHidden(true)
                            .navigationBarTitleDisplayMode(.inline)
                            .barBackButtonToolbar(visible: destination.allowsToPop) {
                                pop()
                            }
                    }
                }
        }
    }
}

private extension NubiWeatherApp {
    @ViewBuilder
    func view(for destination: NavigationDestination) -> some View {
        switch destination {
        case .enterLocationManually:
            EnterLocationView(
                coordinator: EnterLocationCoordinator(
                    navigation: self,
                    locationService: services.locationService
                )
            )
                .navigationTitle("Enter Location")
        case .useMyLocation:
            UseLocationView(
                coordinator: UseLocationCoordinator(
                    navigation: self,
                    locationService:services.locationService
                )
            )
                .navigationTitle("Use my location")
        case let .weatherForecast(location):
            if let weatherService = services.weatherService {
                WeatherForecastView(
                    coordinator: WeatherForecastCoordinator(
                        navigation: self,
                        locationService: services.locationService,
                        weatherService: weatherService,
                        location: location
                    )
                )
            } else {
                /// Here it should be handled more gracefully.
                EmptyView()
            }
        case let .weatherDetails(weather):
            WeatherDetailsView(
                coordinator: WeatherDetailsCoordinator(
                    navigation: self
                ),
                weather: weather
            )
        }
    }
}

extension NubiWeatherApp: Navigation {
    func push(_ element: NavigationDestination) {
        path.append(element)
    }
    
    func pop() {
        path.removeLast(1)
    }
    
    func route(to element: NavigationDestination) {
        guard let index = path.lastIndex(of: element) else {
            return
        }
        path.removeLast(index + 1)
    }
}
