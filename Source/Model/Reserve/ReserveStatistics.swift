import Foundation
import ObjectMapper

/// ReserveStatistics model.
public class ReserveStatistics: Mappable {

    /// The currency from the reserve.
    public private(set) var currency: String?

    /// The commissions, transaction volume, assets and liabilities.
    public private(set) var totals: Total?

    /// The value of held in the associated currency in all supported forms.
    public private(set) var values: [Value]?

    /**
      Constructor.

      - parameter currency: The currency from the reserve.
      - parameter totals: The commissions, transaction volume, assets and liabilities.
      - parameter values: The value of held in the associated currency in all supported forms.
    */
    public init(currency: String, totals: Total, values: [Value]) {
        self.currency = currency
        self.totals = totals
        self.values = values
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
        self.currency <- map["currency"]
        self.totals <- map["totals"]
        self.values <- map["values"]
    }

}
