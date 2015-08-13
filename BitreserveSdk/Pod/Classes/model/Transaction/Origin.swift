import Foundation

/// Origin model.
public class Origin {
    
    /// The card id of the card from the origin of the transaction.
    public private(set) var cardId: String
    
    /// The amount from the origin of the transaction.
    public private(set) var amount: String
    
    /// The base from the origin of the transaction.
    public private(set) var base: String
    
    /// The commission from the origin of the transaction.
    public private(set) var commission: String
    
    /// The currency from the origin of the transaction.
    public private(set) var currency: String
    
    /// The description from the origin of the transaction.
    public private(set) var description: String
    
    /// The fee from the origin of the transaction.
    public private(set) var fee: String
    
    /// The rate from the origin of the transaction.
    public private(set) var rate: String
    
    /// The sources from the origin of the transaction.
    public private(set) var sources: [Source]
    
    /// The type from the origin of the transaction.
    public private(set) var type: String
    
    /// The username from the origin of the transaction.
    public private(set) var username: String
    
    /**
        Constructor.
    
        :param: cardId The card id of the card from the origin of the transaction.
        :param: amount The amount from the origin of the transaction.
        :param: base The base from the origin of the transaction.
        :param: commission The commission from the origin of the transaction.
        :param: currency The currency from the origin of the transaction.
        :param: description The description from the origin of the transaction.
        :param: fee The fee from the origin of the transaction.
        :param: rate The rate from the origin of the transaction.
        :param: sources The sources from the origin of the transaction.
        :param: type The type from the origin of the transaction.
        :param: username The username from the origin of the transaction.
    */
    public init(cardId: String, amount: String, base: String, commission: String, currency: String, description: String, fee: String, rate: String, sources: [Source], type: String, username: String) {
        self.cardId = cardId
        self.amount = amount
        self.base = base
        self.commission = commission
        self.currency = currency
        self.description = description
        self.fee = fee
        self.rate = rate
        self.sources = sources
        self.type = type
        self.username = username
    }
    
}