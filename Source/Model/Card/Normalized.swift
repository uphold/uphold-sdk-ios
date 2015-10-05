import Foundation
import ObjectMapper

/// Normalized model.
public class Normalized: Mappable {

    /// The amount available normalized.
    public private(set) var available: String?

    /// The balance available normalized.
    public private(set) var balance: String?

    /// The currency used in the normalization.
    public private(set) var currency: String?

    /**
      Constructor.

      - parameter available: The amount available normalized.
      - parameter balance: The balance available normalized.
      - parameter currency: The currency used in the normalization.
    */
    public init(available: String, balance: String, currency: String) {
        self.available = available
        self.balance = balance
        self.currency = currency
    }

    // MARK: Required by the ObjectMapper.

    /**
      Constructor.
    */
    required public init?(_ map: Map) {
    }

    /// Maps the JSON to the Object.
    public func mapping(map: Map) {
        available  <- map["available"]
        balance <- map["balance"]
        currency <- map["currency"]
    }

}
