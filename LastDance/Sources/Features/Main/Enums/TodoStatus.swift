//
//  TodoStatus.swift
//  LastDance
//
//  Created by 이지원 on 2/10/26.
//
import SwiftUI

enum TodoStatus {
    case critical, warning, safe

    var text: String {
        switch self {
        case .critical: return "critical"
        case .warning: return "warning"
        case .safe: return "safe"
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
