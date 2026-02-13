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

#Preview{
    ActionButton(title : "취소", action: {})
        .modifier(SecondaryButtonStyle())
    ActionButton(title : "생성", action: {})
        .modifier(PrimaryButtonStyle())
}

