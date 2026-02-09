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
            .padding(.horizontal, LDSpacing.s24)
            .frame(minHeight: LDLayout.minTouch)
            .background(
                RoundedRectangle(cornerRadius: LDRadius.button, style: .continuous)
                    .fill(backgroundColor)
            )
            .overlay(border)
            .foregroundStyle(foregroundColor)
            .opacity(configuration.isPressed ? 0.7 : 1)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(LDAnimation.standard, value: configuration.isPressed)
    }

    private var foregroundColor: Color {
        switch kind {
        case .primary:
            return .white
        case .secondary:
            return LDColor.Text.primary
        case .destructive:
            return .white
        }
    }

    private var backgroundColor: Color {
        switch kind {
        case .primary:
            return LDColor.Brand.primary
        case .secondary:
            return LDColor.Background.surface
        case .destructive:
            return LDColor.Status.danger
        }
    }

    private var border: some View {
        Group {
            if kind == .secondary {
                RoundedRectangle(cornerRadius: LDRadius.button, style: .continuous)
                    .stroke(LDColor.Text.disabled, lineWidth: 1)
            }
        }
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
            .background(LDColor.Background.surface)
            .clipShape(RoundedRectangle(cornerRadius: LDRadius.card, style: .continuous))
    }
}

public struct LDTextFieldStyle: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .padding(.horizontal, LDSpacing.s12)
            .frame(minHeight: LDLayout.minTouch)
            .background(LDColor.Background.surface)
            .clipShape(RoundedRectangle(cornerRadius: LDRadius.textField, style: .continuous))
    }
}

public extension View {
    func ldTextFieldStyle() -> some View {
        modifier(LDTextFieldStyle())
    }
}
