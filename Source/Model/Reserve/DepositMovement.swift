import Foundation
import ObjectMapper

/// DepositMovement model.
public class DepositMovement: Mappable {

    /// The amount of the deposit movement.
    public private(set) final var amount: String?

    /// The currency of the deposit movement.
    public private(set) final var currency: String?

    /**
      Constructor.

      - parameter amount: The amount of the deposit movement.
      - parameter currency: The currency of the deposit movement.
    */
    public init(amount: String, currency: String) {
        self.amount = amount
        self.currency = currency
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
        self.amount <- map["amount"]
        self.currency <- map["currency"]
    }

}
