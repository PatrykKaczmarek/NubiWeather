//
//  SolidButtonStyle.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import SwiftUI

struct SolidButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, minHeight: 20, maxHeight: 20)
            .font(.body)
            .padding()
            .foregroundStyle(isEnabled ? .nubiViolet : .nubiGray)
            .background(isEnabled ? .nubiPink : .nubiDarkGray, in: Capsule())
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
