import Foundation
import ObjectMapper

/// Address model.
public class Address: Mappable {
    
    /// The id of the address.
    public private(set) var id: String?
    
    /// The network of the address.
    public private(set) var network: String?

    /**
        Constructor.
    */
    public init(){
    }
    
    /**
        Constructor.
    
        :param: id The id of the address.
        :param: network The network of the address.
    */
    public init(id: String, network: String) {
        self.id = id
        self.network = network
    }
    
    // MARK: Functions required by the ObjectMapper

    /// Returns a Mappable Address.
    public class func newInstance(map: Map) -> Mappable? {
        return Address()
    }

    /// Maps the JSON to the Object.
    public func mapping(map: Map) {
        id  <- map["id"]
        network <- map["network"]
    }

 }