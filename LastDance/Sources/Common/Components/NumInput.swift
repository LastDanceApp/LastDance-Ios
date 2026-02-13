//
//  NumInput.swift
//  LastDance
//
//  Created by 이지원 on 2/12/26.
//
import SwiftUI

struct NumInput: View {
    let exText: String
    @Binding var value: Int?
    let maxValue: Int
    let height: Int

    var body: some View {
        TextField(exText, value: $value, format: .number)
            .keyboardType(.numberPad)
            .frame(minHeight: 44, maxHeight: 44 * CGFloat(height))
            .padding(.horizontal, 5)
            .padding(.vertical, 5)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.3))
            )
            .onChange(of: value) { _, newValue in
                guard let v = newValue else { return }
                if v > maxValue { value = maxValue }
                if v < 0 { value = 0 }
            }
    }
}

