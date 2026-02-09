import SwiftUI

public struct LDButtonStyle: ButtonStyle {
    public enum Kind {
        case primary
        case secondary
        case destructive
    }

    public let kind: Kind

    public init(_ kind: Kind) {
        self.kind = kind
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(LDTypography.headline.font)
            .padding(.horizontal, LDSpacing.s16)
            .frame(minHeight: LDLayout.minTouch)
            .background(backgroundColor)
            .overlay(border)
            .foregroundStyle(foregroundColor)
            .opacity(configuration.isPressed ? 0.7 : 1)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(LDAnimation.standard, value: configuration.isPressed)
    }

    private var backgroundColor: Color {
        switch kind {
        case .primary:
            return Color.clear
        case .secondary:
            return LDColor.systemGray6
        case .destructive:
            return Color.clear
        }
    }

    private var foregroundColor: Color {
        switch kind {
        case .primary:
            return LDColor.primary
        case .secondary:
            return LDColor.label
        case .destructive:
            return Color(UIColor.systemRed)
        }
    }

    private var border: some View {
        let color: Color = {
            switch kind {
            case .primary:
                return LDColor.primary
            case .secondary:
                return LDColor.systemGray4
            case .destructive:
                return Color(UIColor.systemRed)
            }
        }()

        return RoundedRectangle(cornerRadius: LDRadius.textField, style: .continuous)
            .stroke(color, lineWidth: 1)
    }
}

public struct LDCard<Content: View>: View {
    private let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        content
            .padding(LDSpacing.s16)
            .background(LDColor.secondarySystemBackground)
            .clipShape(RoundedRectangle(cornerRadius: LDRadius.card, style: .continuous))
    }
}

public struct LDTextFieldStyle: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .padding(.horizontal, LDSpacing.s12)
            .frame(minHeight: LDLayout.minTouch)
            .background(LDColor.secondarySystemBackground)
            .clipShape(RoundedRectangle(cornerRadius: LDRadius.textField, style: .continuous))
    }
}

public extension View {
    func ldTextFieldStyle() -> some View {
        modifier(LDTextFieldStyle())
    }
}
