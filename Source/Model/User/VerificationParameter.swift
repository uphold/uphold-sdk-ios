import Foundation
import ObjectMapper

/// Verification parameter model.
open class VerificationParameter: Mappable {

    /// The reason of the verification.
    public private(set) final var reason: String?

    /// The status of the verification.
    public private(set) final var status: String?

    /**
      Constructor.

      - parameter reason: The reason for the verification.
      - parameter status: The status of the verification.
    */
    public init(reason: String, status: String) {
        self.reason = reason
        self.status = status
    }

    // MARK: Required by the ObjectMapper.

    /**
      Constructor.

      - parameter map: Mapping data object.
    */
    required public init?(map: Map) {
    }

    /**
      Maps the JSON to the Object.

      - parameter map: The object to map.
    */
    open func mapping(map: Map) {
        reason  <- map["reason"]
        status  <- map["status"]
    }

}
