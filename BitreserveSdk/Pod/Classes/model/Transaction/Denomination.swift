import Foundation

/// Denomination model.
public class Denomination {
    
    /// The amount of the transaction.
    public private(set) var amount: String
    
    /// The currency of the transaction.
    public private(set) var currency: String
    
    /// The pair of the transaction.
    public private(set) var pair: String
    
    /// The rate of the transaction.
    public private(set) var rate: String
    
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
    
}