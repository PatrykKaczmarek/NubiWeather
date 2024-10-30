//
//  WeatherForecastView.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import SwiftUI

struct WeatherForecastView: View {    
    @StateObject var coordinator: WeatherForecastCoordinator
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Weather forecast")
                .titleStyle()
            
            topLocationView
            
            Button {
//                /// Weather comes from list index
//                coordinator.showForecastDetails(weather: <#T##Weather#>)
            } label: {
                Text("Today")
            }
            .buttonStyle(OutlineButtonStyle())

            Spacer()
        }
        .padding(EdgeInsets(top: 64, leading: 16, bottom: 16, trailing: 16))
        .containerRelativeFrame([.horizontal, .vertical])
        .background(.nubiBlack)
        .onAppear {
//            coordinator.fetchWeather(location: location)
        }
    }
}

fileprivate extension WeatherForecastView {
    @ViewBuilder
    var topLocationView: some View {
        HStack {
            Text("Location")
            
            Spacer()
            
            if let currentCity = coordinator.currentCityName {
                Text(currentCity)
            } else {
                Text("Unknown")
            }
        }
        .bodyStyle()
    }
}
