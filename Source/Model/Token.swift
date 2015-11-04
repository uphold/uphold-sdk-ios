import Foundation
import PromiseKit

/// Token model.
public class Token: BaseModel {

    /// The bearer token.
    private var bearerToken: String?

    /**
      Constructor.
     */
    public override init() {
        super.init()
    }

    /**
      Constructor.

      - parameter token: The bearer token.
     */
    public init(token: String) {
        super.init()

        self.bearerToken = token
    }

}
