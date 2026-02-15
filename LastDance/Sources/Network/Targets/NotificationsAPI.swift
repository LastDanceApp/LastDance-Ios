import Foundation
import Moya

enum NotificationsAPI {
    case list
}

extension NotificationsAPI: BaseTargetType {
    var path: String {
        switch self {
        case .list:
            return "/notifications"
        }
    }

    var method: Moya.Method {
        switch self {
        case .list:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .list:
            return .requestPlain
        }
    }
}

