import Foundation

/// Address model.
public class Address {
    
    /// The id of the address.
    public private(set) var id: String
    
    /// The network of the address.
    public private(set) var network: String
    
    /**
        Constructor.
    
        :param: id The id of the address.
        :param: network The network of the address.
    */
    public init(id: String, network: String) {
        self.id = id
        self.network = network
    }
    
 }