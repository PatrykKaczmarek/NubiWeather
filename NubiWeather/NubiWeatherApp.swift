//
//  NubiWeatherApp.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import SwiftUI

@main
struct NubiWeatherApp: App {
    
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
            EnterLocationView(coordinator: EnterLocationCoordinator(navigation: self))
                .navigationTitle("Enter Location")
        case .useMyLocation:
            UseLocationView(coordinator: UseLocationCoordinator(navigation: self))
                .navigationTitle("Use my location")
        case .weatherForecast:
            WeatherForecastView(coordinator: WeatherForecastCoordinator(navigation: self))
        case .weatherDetails:
            EmptyView()
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
}
