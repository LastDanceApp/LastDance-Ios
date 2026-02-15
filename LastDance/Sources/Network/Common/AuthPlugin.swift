import Foundation
import Moya

final class AuthPlugin: PluginType {
    private let tokenStorage: TokenStorage

    init(tokenStorage: TokenStorage) {
        self.tokenStorage = tokenStorage
    }

    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        guard let token = tokenStorage.accessToken, !token.isEmpty else {
            return request
        }
        var request = request
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        return request
    }
}
