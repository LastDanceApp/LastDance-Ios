import SwiftUI

public struct LDTextStyle {
    public let size: CGFloat
    public let weight: Font.Weight
    public let lineHeight: CGFloat

    public var font: Font { .system(size: size, weight: weight) }
    public var lineSpacing: CGFloat { max(0, lineHeight - size) }
    public var verticalPadding: CGFloat { max(0, (lineHeight - size) / 2) }
}

public enum LDTypography {
    public static let largeTitle = LDTextStyle(size: 34, weight: .bold, lineHeight: 41)
    public static let title1 = LDTextStyle(size: 28, weight: .regular, lineHeight: 34)
    public static let title2 = LDTextStyle(size: 22, weight: .regular, lineHeight: 28)
    public static let title3 = LDTextStyle(size: 20, weight: .regular, lineHeight: 25)
    public static let headline = LDTextStyle(size: 17, weight: .semibold, lineHeight: 22)
    public static let body = LDTextStyle(size: 17, weight: .regular, lineHeight: 22)
    public static let callout = LDTextStyle(size: 16, weight: .regular, lineHeight: 21)
    public static let subhead = LDTextStyle(size: 15, weight: .regular, lineHeight: 20)
    public static let footnote = LDTextStyle(size: 13, weight: .regular, lineHeight: 18)
    public static let caption = LDTextStyle(size: 12, weight: .regular, lineHeight: 16)
}

public extension Text {
    func ldStyle(_ style: LDTextStyle, color: Color = LDColor.label) -> some View {
        self
            .font(style.font)
            .foregroundStyle(color)
            .lineSpacing(style.lineSpacing)
            .padding(.vertical, style.verticalPadding)
    }
}
