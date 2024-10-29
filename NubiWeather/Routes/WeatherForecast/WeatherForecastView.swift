//
//  WeatherForecastView.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import SwiftUI

struct WeatherForecastView: View {
    
    @StateObject var coordinator: WeatherForecastCoordinator
    
    let location: Location
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Weather forecast")
                .titleStyle()
            
            Text("lat: \(location.latitude), long: \(location.longitude)")
                .bodyStyle()
            
            Button {
                coordinator.showForecastDetails()
            } label: {
                Text("Today")
            }
            .buttonStyle(OutlineButtonStyle())

            Spacer()
        }
        .padding(EdgeInsets(top: 64, leading: 16, bottom: 16, trailing: 16))
        .containerRelativeFrame([.horizontal, .vertical])
        .background(.nubiBlack)
    }
}
