import Foundation

protocol TokenStorage {
    var accessToken: String? { get set }
}

final class UserDefaultsTokenStorage: TokenStorage {
    private let key = "auth.accessToken"
    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }

    var accessToken: String? {
        get { userDefaults.string(forKey: key) }
        set { userDefaults.setValue(newValue, forKey: key) }
    }
}
