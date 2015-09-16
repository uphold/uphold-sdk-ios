import Foundation
import ObjectMapper

/// Source model.
public class Source: Mappable {
    
    /// The id of the source.
    public private(set) var id: String?
    
    /// The amount of the source.
    public private(set) var amount: String?

    /**
        Constructor.
    */
    public init() {
    }

    /**
        Constructor.
    
        :param: id The id of the source.
        :param: amount The amount of the source.
    */
    public init(id: String, amount: String) {
        self.id = id
        self.amount = amount
    }
    
    // MARK: Functions required by the ObjectMapper

    /// Returns a Mappable Source.
    public class func newInstance(map: Map) -> Mappable? {
        return Source()
    }

    /// Maps the JSON to the Object.
    public func mapping(map: Map) {
        id  <- map["id"]
        amount <- map["amount"]
    }

}