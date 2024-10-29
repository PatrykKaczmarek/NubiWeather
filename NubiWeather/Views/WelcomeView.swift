//
//  WelcomeView.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import SwiftUI

struct WelcomeView: View {
    
    var onEnterLocation: () -> Void
    var onUseLocation: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Welcome to the weather app!")
                .titleStyle()
            
            Text("To be able to start, we need a location for which the weather information can be retrieved.")
                .bodyStyle()
                .frame(alignment: .leading)
                .padding([.top, .bottom])
            
            Button {
                onEnterLocation()
            } label: {
                Text("Enter location")
            }
            .buttonStyle(OutlineButtonStyle())
            
            Button {
                onUseLocation()
            } label: {
                Text("Use my location")
            }
            .buttonStyle(SolidButtonStyle())
            
            Spacer()
        }
        .padding(EdgeInsets(top: 64, leading: 16, bottom: 16, trailing: 16))
        .containerRelativeFrame([.horizontal, .vertical])
        .background(.nubiDarkGray)
    }
}

#Preview {
    WelcomeView(onEnterLocation: {}, onUseLocation: {})
}
