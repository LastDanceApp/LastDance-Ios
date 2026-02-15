import Foundation
import Moya

protocol BaseTargetType: TargetType {}

extension BaseTargetType {
    var baseURL: URL { APIConstants.baseURL }
    var headers: [String: String]? { APIConstants.defaultHeaders }
}
