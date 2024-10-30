//
//  BodyViewModifier.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import SwiftUI

struct BodyViewModifier: ViewModifier {
    
    let fontWeight: Font.Weight
    
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundStyle(.nubiWhite)
            .fontWeight(fontWeight)
    }
}

extension View {
    func bodyStyle(fontWeight: Font.Weight = .regular) -> some View {
        modifier(BodyViewModifier(fontWeight: fontWeight))
    }
}
