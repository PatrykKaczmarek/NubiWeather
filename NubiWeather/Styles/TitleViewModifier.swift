//
//  TitleViewModifier.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import SwiftUI

struct TitleViewModifier: ViewModifier {
    
    let fontWeight: Font.Weight
    
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .foregroundStyle(.nubiWhite)
            .fontWeight(fontWeight)
    }
}

extension View {
    func titleStyle(fontWeight: Font.Weight = .regular) -> some View {
        modifier(TitleViewModifier(fontWeight: fontWeight))
    }
}
