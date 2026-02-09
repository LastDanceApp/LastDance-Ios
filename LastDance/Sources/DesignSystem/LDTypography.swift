import SwiftUI

public struct LDTextStyle {
    public let size: CGFloat
    public let weight: Font.Weight
    public let lineHeight: CGFloat

    public var font: Font {
        .system(size: size, weight: weight)
    }

    public var lineSpacing: CGFloat {
        max(0, lineHeight - size)
    }

    public var verticalPadding: CGFloat {
        max(0, (lineHeight - size) / 2)
    }
}

public enum LDTypography {
    public static let largeTitle = LDTextStyle(size: 24, weight: .bold, lineHeight: 30)
    public static let title1 = LDTextStyle(size: 20, weight: .bold, lineHeight: 26)
    public static let title2 = LDTextStyle(size: 18, weight: .semibold, lineHeight: 24)
    public static let title3 = LDTextStyle(size: 16, weight: .semibold, lineHeight: 22)
    public static let headline = LDTextStyle(size: 16, weight: .semibold, lineHeight: 22)
    public static let body = LDTextStyle(size: 14, weight: .regular, lineHeight: 20)
    public static let subhead = LDTextStyle(size: 13, weight: .regular, lineHeight: 18)
    public static let footnote = LDTextStyle(size: 12, weight: .regular, lineHeight: 16)
    public static let caption = LDTextStyle(size: 11, weight: .regular, lineHeight: 14)
}

public extension Text {
    func ldStyle(_ style: LDTextStyle, color: Color = LDColor.Text.primary) -> some View {
        self
            .font(style.font)
            .foregroundStyle(color)
            .lineSpacing(style.lineSpacing)
            .padding(.vertical, style.verticalPadding)
    }
}
