import SwiftUI
import UIKit

public enum LDColor {
    public static let primary = Color(hex: 0x2EB2B4)

    public static let systemBackground = Color.dynamic(
        light: UIColor(hex: 0xFFFFFF),
        dark: UIColor(hex: 0x000000)
    )
    public static let secondarySystemBackground = Color.dynamic(
        light: UIColor(hex: 0xF2F2F7),
        dark: UIColor(hex: 0x1C1C1E)
    )
    public static let tertiarySystemBackground = Color.dynamic(
        light: UIColor(hex: 0xFFFFFF),
        dark: UIColor(hex: 0x2C2C2E)
    )

    public static let label = Color.dynamic(
        light: UIColor(hex: 0x000000),
        dark: UIColor(hex: 0xFFFFFF)
    )
    public static let secondaryLabel = Color.dynamic(
        light: UIColor(hex: 0x3C3C43),
        dark: UIColor(hex: 0xEBEBF5)
    )
    public static let tertiaryLabel = Color(hex: 0x3C3C43, alpha: 0.6)
    public static let quaternaryLabel = Color(hex: 0x3C3C43, alpha: 0.1)

    public static let systemGray = Color(hex: 0x8E8E93)
    public static let systemGray2 = Color(hex: 0xAEAEB2)
    public static let systemGray3 = Color(hex: 0xC7C7CC)
    public static let systemGray4 = Color(hex: 0xD1D1D6)
    public static let systemGray5 = Color(hex: 0xE5E5EA)
    public static let systemGray6 = Color(hex: 0xF2F2F7)

    public static let separator = Color.dynamic(
        light: UIColor(red: 60 / 255, green: 60 / 255, blue: 67 / 255, alpha: 0.36),
        dark: UIColor(red: 84 / 255, green: 84 / 255, blue: 88 / 255, alpha: 0.65)
    )
}

public extension Color {
    init(hex: UInt32, alpha: Double = 1.0) {
        let red = Double((hex & 0xFF0000) >> 16) / 255.0
        let green = Double((hex & 0x00FF00) >> 8) / 255.0
        let blue = Double(hex & 0x0000FF) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }

    static func dynamic(light: UIColor, dark: UIColor) -> Color {
        Color(UIColor { traits in
            traits.userInterfaceStyle == .dark ? dark : light
        })
    }
}

public extension UIColor {
    convenience init(hex: UInt32, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
