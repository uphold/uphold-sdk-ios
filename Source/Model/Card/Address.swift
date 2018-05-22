import Foundation
import ObjectMapper

/// Card address model.
open class Address: Mappable {

    /// The id of the created address.
    public private(set) final var id: String?

    /// The network of the created address.
    public private(set) final var network: String?

    /// The tag of the created address if available.
    public private(set) final var tag: String?

    /**
      Constructor.

      - parameter id: The id of the created address.
      - parameter network: The network of the created address.
      - parameter tag: The tag of the created address.
    */
    public init(id: String, network: String, tag: String) {
        self.id = id
        self.network = network
        self.tag = tag
    }

    // MARK: Required by the ObjectMapper.

    /**
      Constructor.

      - parameter map: Mapping data object.
    */
    required public init?(map: Map) {
    }

    /**
      Maps the JSON to the Object.

      - parameter map: The object to map.
    */
    open func mapping(map: Map) {
        self.id <- map["id"]
        self.network <- map["network"]
        self.tag <- map["tag"]
    }

}
