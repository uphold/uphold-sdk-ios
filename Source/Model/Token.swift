import Foundation
import PromiseKit

/// Token model.
public class Token: BaseModel {

    /// The bearer token.
    private(set) var bearerToken: String?

    /**
      Constructor.
     */
    public override init() {
        super.init()
    }

    /**
      Constructor.

      - parameter bearerToken: The bearer token.
     */
    public init(bearerToken: String) {
        super.init()

        self.bearerToken = bearerToken
    }

}
