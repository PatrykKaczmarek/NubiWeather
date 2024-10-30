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
            
            statusView
            
            Button {
                coordinator.requestLocationAuthorization()
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
        .task {
            await coordinator.verifyServices()
        }
    }
}

fileprivate extension UseLocationView {
    @ViewBuilder
    var statusView: some View{
        VStack {
            permissionEntry("Location service", isOn: coordinator.isLocationServiceEnabled, negativeText: "Disabled")
            permissionEntry("Location permission", isOn: coordinator.isLocationPermissionGranted)
        }
    }
    
    @ViewBuilder
    func permissionEntry(
        _ title: String,
        isOn: Bool,
        affirmativeImageName: String = "checkmark",
        negativeImageName: String = "xmark",
        affirmativeText: String = "OK",
        negativeText: String = "Not granted"
    ) -> some View {
        HStack {
            Text(title)
            
            Spacer()
            
            HStack(spacing: 8) {
                Image(systemName: isOn ? affirmativeImageName : negativeImageName)
                    .scaledToFit()
                    .tint(.nubiPink)
                Text(isOn ? affirmativeText : negativeText)
            }
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.nubiGray)
            )
        }
        .bodyStyle()
    }
}
