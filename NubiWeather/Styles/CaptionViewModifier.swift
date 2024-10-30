//
//  CaptionViewModifier.swift
//  NubiWeather
//
//  Created by Patryk on 30/10/2024.
//

import SwiftUI

struct CaptionViewModifier: ViewModifier {
    
    let fontWeight: Font.Weight
    
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundStyle(.nubiWhite)
            .fontWeight(fontWeight)
    }
}

extension View {
    func captionStyle(fontWeight: Font.Weight = .regular) -> some View {
        modifier(CaptionViewModifier(fontWeight: fontWeight))
    }
}
