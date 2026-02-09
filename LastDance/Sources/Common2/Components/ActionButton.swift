//
//  ActionButton.swift
//  LastDance
//
//  Created by 이지원 on 2/9/26.
//

import SwiftUI

struct ActionButton: View {
    let title: String
    let isEnabled: Bool
    let action: () -> Void
    
    var body: some View {
        Button(title, action: action)
            .buttonStyle(LDButtonStyle(.primary))
            .disabled(!isEnabled)
    }
}

#Preview {
    ActionButton(title: "생성", isEnabled: true, action: {})
}
