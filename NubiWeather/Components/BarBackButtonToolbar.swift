//
//  BarBackButtonToolbar.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import SwiftUI

struct BarBackButtonToolbar: ToolbarContent {
    
    var action: () -> Void
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button {
                action()
            } label: {
                Image(systemName: "arrow.left")
                    .tint(.nubiWhite)
            }
        }
    }
}

extension View {
    func barBackButtonToolbar(
        visible: Bool,
        action: @escaping () -> Void
    ) -> some View {
        modifier(
            BarBackButtonToolbarModifier(
                toolbar: BarBackButtonToolbar(action: action),
                visible: visible
            )
        )
    }
}

struct BarBackButtonToolbarModifier: ViewModifier {
    
    let toolbar: BarBackButtonToolbar
    
    let visible: Bool
    
    func body(content: Content) -> some View {
        if visible {
            content.toolbar {
                toolbar
            }
        } else {
            content
        }
    }
}
