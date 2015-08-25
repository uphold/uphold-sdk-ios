import Foundation
import ObjectMapper

/// Denomination model.
public class Denomination: Mappable {
    
    /// The amount of the transaction.
    public private(set) var amount: String?
    
    /// The currency of the transaction.
    public private(set) var currency: String?
    
    /// The pair of the transaction.
    public private(set) var pair: String?
    
    /// The rate of the transaction.
    public private(set) var rate: String?

    /**
        Constructor.
    */
    public init() {
    }
    
    /**
        Constructor.
    
        :param: amount The amount of the transaction.
        :param: currency The currency of the transaction.
        :param: pair The pair of the transaction.
        :param: rate The rate of the transaction.
    */
    public init(amount: String, currency: String, pair: String, rate: String) {
        self.amount = amount
        self.currency = currency
        self.pair = pair
        self.rate = rate
    }
    
    // MARK: Functions required by the ObjectMapper

    /// Returns a Mappable Denomination.
    public class func newInstance(map: Map) -> Mappable? {
        return Denomination()
    }

    /// Maps the JSON to the Object.
    public func mapping(map: Map) {
        amount  <- map["amount"]
        currency <- map["currency"]
        pair <- map["pair"]
        rate <- map["rate"]
    }

}