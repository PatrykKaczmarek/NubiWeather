//
//  WeatherDetailsView.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import SwiftUI

struct WeatherDetailsView: View {
    
    @StateObject var coordinator: WeatherDetailsCoordinator
    
    let weather: Weather
    
    var body: some View {
        VStack(spacing: 16) {
            Text(weather.dayName)
                .titleStyle()
            
            HStack {
                temperatureView(value: weather.temperatureMax, description: "Highest value")
                    .frame(maxWidth: .infinity)
                    .padding(.trailing, 100)
                
                temperatureView(value: weather.temperatureMin, description: "Lowest value")
                    .frame(maxWidth: .infinity)
            }
            .fixedSize(horizontal: true, vertical: false)
            
            if let condition = weather.condition{
                Text(condition)
                    .bodyStyle(fontWeight: .bold)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            barView(
                title: "Average humidity",
                value: weather.humidityAvg
            )
            
            numberView(
                title: "Average probability of rain",
                value: "\(Int(weather.precipitationProbabilityAvg)) %"
            )
            if let uvIndex = weather.uvIndexMin {
                numberView(
                    title: "Minimum UV Index",
                    value: "\(uvIndex)"
                )
            }
            numberView(
                title: "Maximum wind speed",
                value: "\(Int(weather.windSpeedMax)) km/h"
            )
            numberView(
                title: "Average visibility",
                value: "\(Int(weather.visibilityAvg)) m"
            )
            numberView(
                title: "Average air pressure",
                value: "\(Int(weather.pressureSurfaceLevelAvg)) mbar"
            )
            if let sunriseTime = weather.sunriseTime {
                numberView(
                    title: "Sunrise",
                    value: sunriseTime
                )
            }
            if let sunsetTime = weather.sunsetTime {
                numberView(
                    title: "Sunset",
                    value: sunsetTime
                )
            }
            
            Spacer()
        }
        .padding(EdgeInsets(top: 64, leading: 16, bottom: 16, trailing: 16))
        .containerRelativeFrame([.horizontal, .vertical])
        .background(.nubiBlack)
    }
}

private extension WeatherDetailsView {
    @ViewBuilder
    func temperatureView(value: Double, description: String) -> some View {
        VStack(alignment: .leading) {
            Text("\(Int(value)) ºC")
                .titleStyle(fontWeight: .bold)
            
            Text(description)
                .captionStyle()
        }
    }
    
    @ViewBuilder
    func numberView(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .captionStyle()
            Spacer()
            Text(value)
                .captionStyle()
        }
    }
    
    @ViewBuilder
    func barView(title: String, value: Double) -> some View {
        VStack {
            numberView(title: title, value: "\(Int(value)) %")
            ProgressView(value: value, total: 100)
                .progressViewStyle(.linear)
                .tint(.nubiPink)

        }
    }
}
