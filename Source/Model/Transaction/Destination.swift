import Foundation
import ObjectMapper

/// Destination model.
public class Destination: Mappable {

    /// The card id of the card from the destination of the transaction.
    public private(set) var cardId: String?

    /// The amount from the destination of the transaction.
    public private(set) var amount: String?

    /// The base from the destination of the transaction.
    public private(set) var base: String?

    /// The commission from the destination of the transaction.
    public private(set) var commission: String?

    /// The currency from the destination of the transaction.
    public private(set) var currency: String?

    /// The description from the destination of the transaction.
    public private(set) var description: String?

    /// The fee from the destination of the transaction.
    public private(set) var fee: String?

    /// The rate from the destination of the transaction.
    public private(set) var rate: String?

    /// The type from the destination of the transaction.
    public private(set) var type: String?

    /// The username from the destination of the transaction.
    public private(set) var username: String?

    /**
      Constructor.
      
      - parameter cardId: The card id of the card from the destination of the transaction.
      - parameter amount: The amount from the destination of the transaction.
      - parameter base: The base from the destination of the transaction.
      - parameter commission: The commission from the destination of the transaction.
      - parameter currency: The currency from the destination of the transaction.
      - parameter description: The description from the destination of the transaction.
      - parameter fee: The fee from the destination of the transaction.
      - parameter rate: The rate from the destination of the transaction.
      - parameter type: The type from the destination of the transaction.
      - parameter username: The username from the destination of the transaction.
    */
    public init(cardId: String, amount: String, base: String, commission: String, currency: String, description: String, fee: String, rate: String, type: String, username: String) {
        self.cardId = cardId
        self.amount = amount
        self.base = base
        self.commission = commission
        self.currency = currency
        self.description = description
        self.fee = fee
        self.rate = rate
        self.type = type
        self.username = username
    }

    // MARK: Required by the ObjectMapper.

    /**
      Constructor.
    */
    required public init?(_ map: Map) {
    }

    /// Maps the JSON to the Object.
    public func mapping(map: Map) {
        cardId  <- map["CardId"]
        amount <- map["amount"]
        base <- map["base"]
        commission <- map["commission"]
        currency <- map["currency"]
        description <- map["description"]
        fee <- map["fee"]
        rate <- map["rate"]
        type <- map["type"]
        username <- map["username"]
    }

}
