import SwiftUI

public enum LDLayout {
    public static let safeTop = CGFloat(44)
    public static let navBar = CGFloat(44)
    public static let safeTopWithNav = CGFloat(88)
    public static let safeBottom = CGFloat(34)
    public static let minTouch = CGFloat(44)
}

public enum LDSpacing {
    public static let s4 = CGFloat(4)
    public static let s8 = CGFloat(8)
    public static let s12 = CGFloat(12)
    public static let s16 = CGFloat(16)
    public static let s20 = CGFloat(20)
    public static let s24 = CGFloat(24)
    public static let s32 = CGFloat(32)
    public static let s48 = CGFloat(48)
}

public enum LDGrid {
    public static let phoneMargin = CGFloat(16)
    public static let padMargin = CGFloat(20)
    public static let listIndent = CGFloat(16)

    public static func horizontalMargin(for sizeClass: UserInterfaceSizeClass?) -> CGFloat {
        sizeClass == .regular ? padMargin : phoneMargin
    }
}

public enum LDRadius {
    public static let textField = CGFloat(12)
    public static let card = CGFloat(16)
}

public enum LDAnimation {
    public static let standard = Animation.timingCurve(0.25, 0.1, 0.25, 1, duration: 0.35)
}
