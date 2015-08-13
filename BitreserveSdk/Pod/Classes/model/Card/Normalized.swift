import Foundation

/// Normalized model.
public class Normalized {
    
    /// The amount available normalized.
    public private(set) var available: String
    
    /// The balance available normalized.
    public private(set) var balance: String
    
    /// The currency used in the normalization.
    public private(set) var currency: String
    
    /**
        Constructor.
    
        :param: available The amount available normalized.
        :param: balance The balance available normalized.
        :param: currency The currency used in the normalization.
    */
    public init(available: String, balance: String, currency: String) {
        self.available = available
        self.balance = balance
        self.currency = currency
    }
    
}