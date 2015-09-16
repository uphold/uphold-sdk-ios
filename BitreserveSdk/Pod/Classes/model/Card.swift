import Foundation

/// Card model.
public class Card {
  
    /// The id of the card.
    public private(set) var id: String
    
    /// The address of the card.
    public private(set) var address: [String: String]
    
    /// The list of address for the card.
    public private(set) var addresses: [Address]
    
    /// The balance available for withdrawal/usage.
    public private(set) var available: String
    
    /// The total balance of the card, including all pending transactions.
    public private(set) var balance: String
    
    /// The currency of the card.
    public private(set) var currency: String
    
    /// The display name of the card as chosen by the user.
    public private(set) var label: String
    
    /// A timestamp of the last time a transaction on this card was conducted.
    public private(set) var lastTransactionAt: String
    
    /// The list with the normalized fields.
    public private(set) var normalized: [Normalized]
    
    /// The Settings of the card.
    public private(set) var settings: CardSettings

    /**
        Constructor.
    
        :param: id The id of the card.
        :param: address The address of the card.
        :param: addresses The list of address for the card.
        :param: available The balance available for withdrawal/usage.
        :param: balance The total balance of the card, including all pending transactions.
        :param: currency The currency of the card.
        :param: label The display name of the card as chosen by the user.
        :param: lastTransactionAt A timestamp of the last time a transaction on this card was conducted.
        :param: normalized The list with the normalized fields.
        :param: settings The Settings of the card.
    */
    public init(id: String, address: [String: String], addresses: [Address], available: String, balance: String, currency: String, label: String, lastTransactionAt: String, normalized: [Normalized], settings: CardSettings) {
        self.id = id;
        self.address = address
        self.addresses = addresses
        self.available = available
        self.balance = balance
        self.currency = currency
        self.label = label
        self.lastTransactionAt = lastTransactionAt
        self.normalized = normalized
        self.settings = settings
    }

}