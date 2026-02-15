import Foundation
import Moya

enum WitnessesAPI {
    case list
}

extension WitnessesAPI: BaseTargetType {
    var path: String {
        switch self {
        case .list:
            return "/witnesses"
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
