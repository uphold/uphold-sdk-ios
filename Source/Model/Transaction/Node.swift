import Foundation
import ObjectMapper

/// Source model.
public class Node: Mappable {

    /// The type of the node.
    public private(set) final var type: String?

    /**
      Constructor.

      - parameter type: The type of the node.
    */
    public init(type: String) {
        self.type = type
    }

    // MARK: Required by the ObjectMapper.

    /**
      Constructor.

      - parameter map: Mapping data object.
    */
    required public init?(_ map: Map) {
    }

    /**
      Maps the JSON to the Object.

      - parameter map: The object to map.
    */
    public func mapping(map: Map) {
        type <- map["type"]
    }
}
