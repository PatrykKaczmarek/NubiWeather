//
//  UseLocationView.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import SwiftUI

struct UseLocationView: View {
    
    @StateObject var coordinator: UseLocationCoordinator
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Grant location authorisations")
                .titleStyle()
            
            Text("To be able to access your location, the app requires authorisation to do so.\nYour phone must also support this.")
                .bodyStyle()
                .frame(alignment: .leading)
                .padding([.top, .bottom])
            
            Button {
                // setup coordinator here
            } label: {
                Text("Check again")
            }
            .buttonStyle(OutlineButtonStyle())
            
            Button {
                coordinator.confirmLocation()
            } label: {
                Text("Done")
            }
            .buttonStyle(SolidButtonStyle())
            
            Spacer()
        }
        .padding(EdgeInsets(top: 64, leading: 16, bottom: 16, trailing: 16))
        .containerRelativeFrame([.horizontal, .vertical])
        .background(.nubiBlack)
    }
}
