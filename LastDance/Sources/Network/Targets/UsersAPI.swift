import Foundation
import Moya

enum UsersAPI {
    case login(request: LoginRequest)
}

extension UsersAPI: BaseTargetType {
    var path: String {
        switch self {
        case .login:
            return "/users/login"
        }
    }

    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        }
    }

    var task: Task {
        switch self {
        case .login(let request):
            return .requestJSONEncodable(request)

        }
    }
}

