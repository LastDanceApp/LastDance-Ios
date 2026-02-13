import SwiftUI

struct PrimaryButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content.buttonStyle(LDButtonStyle(.primary))
    }
}

struct SecondaryButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content.buttonStyle(LDButtonStyle(.secondary))
    }
}

struct DestructiveButtonStyle: ViewModifier{
    func body(content: Content) -> some View {
        content.buttonStyle(LDButtonStyle(.destructive))
    }
}

struct IDidItButtonStyle: ViewModifier{
    func body(content: Content) -> some View {
        content.buttonStyle(LDButtonStyle(.destructive))
    }
}

struct IHateItButtonStyle: ViewModifier{
    func body(content: Content) -> some View {
        content.buttonStyle(LDButtonStyle(.destructive))
    }
}

struct SendMessageButtonStyle: ViewModifier{
    func body(content: Content) -> some View {
        content.buttonStyle(LDButtonStyle(.primary))
    }
}

struct FastCheerUpButton: ViewModifier{
    func body(content: Content) -> some View {
        content.buttonStyle(LDButtonStyle(.primary))
    }
}

#Preview{
    ActionButton(title : "취소", action: {})
        .modifier(SecondaryButtonStyle())
    ActionButton(title : "생성", action: {})
        .modifier(PrimaryButtonStyle())
}

