import Foundation

struct ApiResponse<ResultType: Decodable>: Decodable {
    let isSuccess: Bool
    let code: String
    let message: String
    let result: ResultType?
}

