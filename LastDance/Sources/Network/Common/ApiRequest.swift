import Foundation
import Moya

struct ApiRequest<Body: Encodable> {
    let body: Body

    init(_ body: Body) {
        self.body = body
    }

    var task: Task {
        .requestJSONEncodable(body)
    }
}

