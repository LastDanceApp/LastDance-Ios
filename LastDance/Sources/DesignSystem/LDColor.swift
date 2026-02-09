import SwiftUI
import UIKit

public enum LDColor {

    public enum Brand {
        public static let primary = Color(hex: 0x2EB2B4)
        public static let primaryDark = Color(hex: 0x0F8F92)
    }

    public enum Background {
        public static let app = Color(hex: 0xF8FAFC)
        public static let surface = Color(hex: 0xFFFFFF)
    }

    public enum Text {
        public static let primary = Color(hex: 0x1E293B)
        public static let secondary = Color(hex: 0x94A3B8)
        public static let disabled = Color(hex: 0x94A3B8, alpha: 0.6)
    }

    public enum Status {
        public static let danger = Color(hex: 0xEF4444)
        public static let warning = Color(hex: 0xF59E0B)
        public static let safe = Color(hex: 0x2EB2B4)
    }

    public enum System {
        public static let separator = Color.dynamic(
            light: UIColor(white: 0.23, alpha: 0.36),
            dark: UIColor(white: 0.33, alpha: 0.65)
        )
    }
    
    public enum Border{
        public static let divider = Color(hex: 0xE5E5E5)
    }
    
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
