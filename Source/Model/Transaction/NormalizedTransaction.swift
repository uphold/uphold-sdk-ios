import Foundation
import ObjectMapper

/// Transaction normalized model.
public class NormalizedTransaction: Mappable {

    /// The amount of the transaction normalized.
    public private(set) var amount: String?

    /// The commission of the transaction normalized.
    public private(set) var commission: String?

    /// The currency of the transaction normalized.
    public private(set) var currency: String?

    /// The fee of the transaction normalized.
    public private(set) var fee: String?

    /// The rate of the transaction normalized.
    public private(set) var rate: String?

    /**
      Constructor.

      - parameter amount: The amount of the transaction normalized.
      - parameter commission: The commission of the transaction normalized.
      - parameter currency: The currency of the transaction normalized.
      - parameter fee: The fee of the transaction normalized.
      - parameter rate: The rate of the transaction normalized.
    */
    public init(amount: String, commission: String, currency: String, fee: String, rate: String) {
        self.amount = amount
        self.commission = commission
        self.currency = currency
        self.fee = fee
        self.rate = rate
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
        self.commission <- map["commission"]
        self.currency <- map["currency"]
        self.fee <- map["fee"]
        self.rate <- map["rate"]
    }
}
