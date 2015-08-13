import Foundation

/// Source model.
public class Source {
    
    /// The id of the source.
    public private(set) var id: String
    
    /// The amount of the source.
    public private(set) var amount: String

    /**
        Constructor.
    
        :param: id The id of the source.
        :param: amount The amount of the source.
    */
    public init(id: String, amount: String) {
        self.id = id
        self.amount = amount
    }
    
}