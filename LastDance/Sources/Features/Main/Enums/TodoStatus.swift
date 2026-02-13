
import SwiftUI

enum TodoStatus {
    case critical, warning, safe

    var text: String {
        switch self {
        case .critical: return "CRITICAL"
        case .warning: return "WARNING"
        case .safe: return "SAFE"
        }
    }

    var color: Color {
        switch self {
        case .critical: return LDColor.Status.danger
        case .warning: return LDColor.Status.warning
        case .safe: return LDColor.Status.safe
        }
    }
}

