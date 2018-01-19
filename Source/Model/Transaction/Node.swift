import Foundation
import ObjectMapper

/// Node model.
open class Node: Mappable {

    /// The brand.
    public private(set) final var brand: String?

    /// The id.
    public private(set) final var id: String?

    /// The type.
    public private(set) final var type: String?

    /**
      Constructor.

      - parameter brand: The brand.
      - parameter id: The id.
      - parameter type: The type.
    */
    public init(brand: String, id: String, type: String) {
        self.brand = brand
        self.id = type
        self.type = type
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
        brand  <- map["brand"]
        id <- map["id"]
        type <- map["type"]
    }

}
