import Foundation
import ObjectMapper

/// Withdraw otp settings model.
public class Withdraw: Mappable {

    /// The transactions withdraw crypto otp settings.
    public private(set) final var crypto: Crypto?

    /**
      Constructor.

      - parameter crypto: The transactions withdraw crypto otp settings.
    */
    public init(crypto: Crypto) {
        self.crypto = crypto
    }

    // MARK: Required by the ObjectMapper.

    /**
      Constructor.

      - parameter map: Mapping data object.
    */
    required public init?(_ map: Map) {
    }

    /**
      Maps the JSON to the Object.

      - parameter map: The object to map.
    */
    public func mapping(map: Map) {
        self.crypto <- map["crypto"]
    }

}
