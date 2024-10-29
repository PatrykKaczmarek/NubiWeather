//
//  TitleViewModifier.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import SwiftUI

struct TitleViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .foregroundStyle(.nubiWhite)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(TitleViewModifier())
    }
}
