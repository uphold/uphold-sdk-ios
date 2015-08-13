import Foundation

/// Parameters model.
public class Parameters {
    
    /// The transaction currency.
    public private(set) var currency: String
    
    /// The transaction margin.
    public private(set) var margin: String
    
    /// The transaction pair.
    public private(set) var pair: String
    
    /// The transaction progress.
    public private(set) var progress: String
    
    /// The transaction rate.
    public private(set) var rate: String
    
    /// The transaction ttl.
    public private(set) var ttl: String
    
    /// The transaction txid.
    public private(set) var txid: String
    
    /// The transaction type.
    public private(set) var type: String

    /**
        Constructor.
    
        :param: currency The transaction currency.
        :param: margin The transaction margin.
        :param: pair The transaction pair.
        :param: progress The transaction progress.
        :param: rate The transaction rate.
        :param: ttl The transaction ttl.
        :param: txid The transaction txid.
        :param: type The transaction type.
    */
    public init(currency: String, margin: String, pair: String, progress: String, rate: String, ttl: String, txid: String, type: String) {
        self.currency = currency
        self.margin = margin
        self.pair = pair
        self.progress = progress
        self.rate = rate
        self.ttl = ttl
        self.txid = txid
        self.type = type
    }
    
}
