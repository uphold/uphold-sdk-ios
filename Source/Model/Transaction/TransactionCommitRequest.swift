import Foundation
import ObjectMapper

/// Transaction commit request model.
public class TransactionCommitRequest: Mappable {

    /// The transaction message.
    public private(set) final var message: String?

    /**
      Constructor.

      - parameter message: The transaction message.
    */
    public init(message: String) {
        self.message = message
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
        self.message <- map["message"]
    }

}
