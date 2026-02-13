//
//  TodoDetailButton.swift
//  LastDance
//
//  Created by 김준용 on 2/10/26.
//

/**
    Todo 디테일에서 쓰이는 버튼
 */

import SwiftUI

struct TodoDetailButton: View {
    let title: String
    let imageName: String?
    let backgroundColor: Color
    let action: () -> Void

    init(
        title: String,
        imageName: String? = nil,
        backgroundColor: Color = .clear,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.imageName = imageName
        self.backgroundColor = backgroundColor
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: LDSpacing.s8) {
                if let imageName {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                }
                Text(title)
                    .font(.system(
                        size: LDTypography.subhead.size, weight: .medium
                    ))
                    .foregroundStyle(Color.white)
                    .ldStyle(LDTypography.headline, color: LDColor.Text.primary)
            }
            .padding(.horizontal, LDSpacing.s24)
            .frame(minHeight: LDLayout.minTouch)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: LDRadius.button, style: .continuous)
                    .fill(backgroundColor)
            )
            .overlay(
                RoundedRectangle(cornerRadius: LDRadius.button, style: .continuous)
                    .stroke(LDColor.Border.divider, lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
}
