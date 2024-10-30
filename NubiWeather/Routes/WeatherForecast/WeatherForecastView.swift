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
            
            List(coordinator.weather) { weather in
                WeatherForecastRow(weather: weather)
                    .onTapGesture {
                        coordinator.showForecastDetails(weather: weather)
                    }
                    .listRowSeparator(.hidden)
                    .listRowInsets(.init(top: 8, leading: 0, bottom: 8, trailing: 0))
                    .listRowBackground(Color.clear)
            }
            .listStyle(.inset)
            .scrollContentBackground(.hidden)
        }
        .padding(EdgeInsets(top: 64, leading: 16, bottom: 16, trailing: 16))
        .containerRelativeFrame([.horizontal, .vertical])
        .background(.nubiBlack)
        .onAppear {
            coordinator.fetchWeather()
        }
    }
}

fileprivate extension WeatherForecastView {
    @ViewBuilder
    var topLocationView: some View {
        HStack {
            Text("Location")
            
            Spacer()
            
            Group {
                if let currentCity = coordinator.currentCityName {
                    Text(currentCity)
                } else {
                    Text("Unknown")
                }
            }
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.nubiWhite, lineWidth: 0.4)
            )
        }
        .bodyStyle()
    }
}
