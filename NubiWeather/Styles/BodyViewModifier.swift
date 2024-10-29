//
//  BodyViewModifier.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import SwiftUI

struct BodyViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundStyle(.nubiWhite)
    }
}

extension View {
    func bodyStyle() -> some View {
        modifier(BodyViewModifier())
    }
}
