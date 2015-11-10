import Foundation
import KeychainSwift

/// Session manager.
public class SessionManager {

    /// The keychain key to access the bearer token.
    static let KEYCHAIN_TOKEN_KEY = "com.uphold.sdk.token"

    /// The singleton's shared instance.
    static let sharedInstance = SessionManager()

    /// Keychain access object.
    let keychain: KeychainSwift

    /// Queue to manage concurrency.
    let lockQueue: dispatch_queue_t

    /**
      Constructor.
     */
    private init() {
        self.keychain = KeychainSwift()
        self.lockQueue = dispatch_queue_create(GlobalConfigurations.BUNDLE_NAME, nil)

        self.invalidateSession()
    }

    /**
      Sets the bearer token.

      - parameter token: The bearer token.
     */
    func getBearerToken() -> String? {
        guard let token = self.keychain.get(SessionManager.KEYCHAIN_TOKEN_KEY) else {
            return nil
        }

        return token
    }

    /**
      Sets the bearer token.

      - parameter token: The bearer token.
     */
    func setBearerToken(token: String) {
        self.invalidateSession()

        dispatch_sync(self.lockQueue) {
            self.keychain.set(token, forKey: SessionManager.KEYCHAIN_TOKEN_KEY)
        }
    }

    /**
      Deletes the bearer token from the keychain.
     */
    func invalidateSession() {
        dispatch_sync(self.lockQueue) {
            self.keychain.delete(SessionManager.KEYCHAIN_TOKEN_KEY)
        }
    }

}
