import Foundation
import ObjectMapper

/// Card model.
public class Card: Mappable {

    /// The id of the card.
    public private(set) var id: String?

    /// The card's primary address dictionary.
    public private(set) var address: [String : String]?

    /// The balance available for withdrawal/usage.
    public private(set) var available: String?

    /// The total balance of the card, including all pending transactions.
    public private(set) var balance: String?

    /// The currency of the card.
    public private(set) var currency: String?

    /// The display name of the card as chosen by the user.
    public private(set) var label: String?

    /// A timestamp of the last time a transaction on this card was conducted.
    public private(set) var lastTransactionAt: String?

    /// The card details normalized.
    public private(set) var normalized: [NormalizedCard]?

    /// The card settings.
    public private(set) var settings: CardSettings?

    /**
      Constructor.

      - parameter id: The id of the card.
      - parameter address: The card's primary address dictionary.
      - parameter available: The balance available for withdrawal/usage.
      - parameter balance: The total balance of the card, including all pending transactions.
      - parameter currency: The currency of the card.
      - parameter label: The display name of the card as chosen by the user.
      - parameter lastTransactionAt: A timestamp of the last time a transaction on this card was conducted.
      - parameter normalized: The card details normalized.
      - parameter settings: The Settings of the card.
    */
    public init(id: String, address: [String : String], available: String, balance: String, currency: String, label: String, lastTransactionAt: String?, normalized: [NormalizedCard], settings: CardSettings) {
        self.id = id
        self.address = address
        self.available = available
        self.balance = balance
        self.currency = currency
        self.label = label
        self.lastTransactionAt = lastTransactionAt
        self.normalized = normalized
        self.settings = settings
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
        self.id <- map["id"]
        self.address <- map["address"]
        self.available <- map["available"]
        self.balance <- map["balance"]
        self.currency <- map["currency"]
        self.label <- map["label"]
        self.lastTransactionAt <- map["lastTransactionAt"]
        self.normalized <- map["normalized"]
        self.settings <- map["settings"]
    }

}
