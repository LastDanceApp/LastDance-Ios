import Foundation
import Moya

final class LoginViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var pw: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private var tokenStorage: TokenStorage
    private var provider: MoyaProvider<UsersAPI>

    init(
        tokenStorage: TokenStorage = UserDefaultsTokenStorage(),
        provider: MoyaProvider<UsersAPI>? = nil
    ) {
        self.tokenStorage = tokenStorage
        self.provider = provider ?? MoyaProvider<UsersAPI>(plugins: [AuthPlugin(tokenStorage: tokenStorage)])
    }

    func login() {
        
        let request = LoginRequest(id: id, pw: pw)

//        provider.request(.login(request: request)) {
//            
//        }
        
    }
}
