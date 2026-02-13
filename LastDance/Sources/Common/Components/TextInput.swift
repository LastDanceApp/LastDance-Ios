//
//  TextInput.swift
//  LastDance
//
//  Created by 이지원 on 2/12/26.
//
import SwiftUI

struct TextInput: View {
    var exText: String
    @Binding var text: String
    var maxText : Int
    var height : Int
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(exText)
                    .foregroundColor(LDColor.Text.secondary)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
                    .allowsHitTesting(false)
            }
            
            TextEditor(text: $text)
                .frame(minHeight: 44, maxHeight: 44 * CGFloat(height))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3))
                )
                .scrollContentBackground(.hidden)
                .background(Color.clear)
        }
        .onChange(of: text) { oldValue, newValue in guard newValue.count > maxText else { return }
            text = String(newValue.prefix(maxText))
        }

    }
}

#Preview {
    TextInput(exText: "예시",
              text: .constant(""),
              maxText: 10,
              height: 1)
}
