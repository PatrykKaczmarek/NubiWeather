//
//  SearchField.swift
//  NubiWeather
//
//  Created by Patryk on 29/10/2024.
//

import SwiftUI

struct SearchField: View {
    
    @Binding var text: String
    
    let placeholder: String
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack {
            Label {
                TextField("", text: $text, prompt: Text(placeholder).foregroundStyle(.nubiWhite))
                    .padding(EdgeInsets(top: 8, leading: 4, bottom: 8, trailing: 0))
                    .focused($isFocused)
                    .bodyStyle()
                    .tint(.nubiWhite)
            } icon: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 20, height: 20)
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 0))
                    .foregroundStyle(.nubiWhite)
            }
            .frame(height: 60)
            
            if !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    Image(systemName: "x.circle").resizable()
                        .renderingMode(.template)
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.nubiWhite)
                        .padding()
                }
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 2)
                .stroke(isFocused ? .nubiPink : .nubiWhite, lineWidth: isFocused ? 2 : 1)
        )
    }
}

#Preview {
    @Previewable @State var text = String()
    SearchField(text: $text, placeholder: "PLACEHOLDER")
}
