//
//  EnterLocationView.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import SwiftUI

struct EnterLocationView: View {
    
    @StateObject var coordinator: EnterLocationCoordinator
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Search your location")
                .titleStyle()
            
            Text("Search for your location in the following text field and then select it from the list.")
                .bodyStyle()
                .frame(alignment: .leading)
                .padding([.top, .bottom])
            
            SearchField(text: $coordinator.location, placeholder: "Location")
                .padding(.bottom)
            
            Button {
                coordinator.confirmLocation()
            } label: {
                Text("Done")
            }
            .buttonStyle(SolidButtonStyle())
            .disabled(coordinator.location.isEmpty)
            
            Spacer()
        }
        .padding(EdgeInsets(top: 64, leading: 16, bottom: 16, trailing: 16))
        .containerRelativeFrame([.horizontal, .vertical])
        .background(.nubiBlack)
    }
}
