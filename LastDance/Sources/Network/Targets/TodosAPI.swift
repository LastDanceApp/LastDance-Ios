import Foundation
import Moya

enum TodosAPI {
    case list
}

extension TodosAPI: BaseTargetType {
    var path: String {
        switch self {
        case .list:
            return "/todos"
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
