//
//  EnterLocationView.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import SwiftUI

struct EnterLocationView: View {
    
    @State var location: String
    
    var confirmation: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Search your location")
                .titleStyle()
            
            Text("Search for your location in the following text field and then select it from the list.")
                .bodyStyle()
                .frame(alignment: .leading)
                .padding([.top, .bottom])
            
            SearchField(text: $location, placeholder: "Location")
                .padding(.bottom)
            
            Button {
                confirmation()
            } label: {
                Text("Done")
            }
            .buttonStyle(SolidButtonStyle())
            .disabled(location.isEmpty)
            
            Spacer()
        }
        .padding(EdgeInsets(top: 64, leading: 16, bottom: 16, trailing: 16))
        .containerRelativeFrame([.horizontal, .vertical])
        .background(.nubiBlack)
    }
}

#Preview {
    @Previewable @State var location = String()
    EnterLocationView(location: location, confirmation: {})
}
