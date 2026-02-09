//
//  FloatingCreateButton.swift
//  LastDance
//
//  Created by 이지원 on 2/10/26.
//
import SwiftUI

struct FloatingCreateButton: View {
    let isEnabled: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "plus")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .frame(width: 56, height: 56)
                .background(LDColor.Brand.primary)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
                .opacity(isEnabled ? 1.0 : 0.4)
        }
        .disabled(!isEnabled)
    }
}
