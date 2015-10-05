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

      - parameter id: The id of the address.
      - parameter network: The network of the address.
    */
    public init(id: String, network: String) {
        self.id = id
        self.network = network
    }

    // MARK: Required by the ObjectMapper.

    /**
      Constructor.
    */
    required public init?(_ map: Map) {
    }

    /// Maps the JSON to the Object.
    public func mapping(map: Map) {
        id  <- map["id"]
        network <- map["network"]
    }

}
