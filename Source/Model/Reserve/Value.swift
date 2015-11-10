import Foundation
import ObjectMapper

/// Value model.
public class Value: Mappable {

    /// The quantity of assets held for the corresponding holding, but converted to a different currency.
    public private(set) var assets: String?

    /// The currency we are computing the current holding in.
    public private(set) var currency: String?

    /// The quantity of liabilities for the corresponding holding, but converted to a different currency.
    public private(set) var liabilities: String?

    /// The rate we used when computing the holding to the corresponding currency.
    public private(set) var rate: String?

    /**
      Constructor.

      - parameter assets: The quantity of assets held for the corresponding holding, but converted to a different currency.
      - parameter currency: The currency we are computing the current holding in.
      - parameter liabilities: The quantity of liabilities for the corresponding holding, but converted to a different currency.
      - parameter rate: The rate we used when computing the holding to the corresponding currency.
    */
    public init(assets: String, currency: String, liabilities: String, rate: String) {
        self.assets = assets
        self.currency = currency
        self.liabilities = liabilities
        self.rate = rate
    }

    // MARK: Required by the ObjectMapper.

    /**
      Constructor.
    */
    required public init?(_ map: Map) {
    }

    /**
      Maps the JSON to the Object.

      - parameter map: The object to map.
     */
    public func mapping(map: Map) {
        self.assets <- map["assets"]
        self.currency <- map["currency"]
        self.liabilities <- map["liabilities"]
        self.rate <- map["rate"]
    }

}
