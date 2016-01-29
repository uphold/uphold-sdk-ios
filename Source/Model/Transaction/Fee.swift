import Foundation
import ObjectMapper

/// Fee model.
public class Fee: Mappable {

    /// The amount.
    public private(set) var amount: String?

    /// The currency.
    public private(set) var currency: String?

    /// The percentage.
    public private(set) var percentage: String?

    /// The target.
    public private(set) var target: String?

    /// The type.
    public private(set) var type: String?

    /**
      Constructor.

      - parameter amount: The amount.
      - parameter currency: The currency.
      - parameter percentage: The percentage.
      - parameter target: The target.
      - parameter type: The type.
    */
    public init(amount: String, currency: String, percentage: String, target: String, type: String) {
        self.amount = amount
        self.currency = currency
        self.percentage = percentage
        self.target = target
        self.type = type
    }

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
        amount <- map["amount"]
        currency <- map["currency"]
        percentage <- map["percentage"]
        target <- map["target"]
        type <- map["type"]
    }

}
