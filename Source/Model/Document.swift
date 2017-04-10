import Foundation
import ObjectMapper

/// Document model.
public class Document: Mappable {

    /// The document type.
    public private(set) final var type: String?

    /// The document value.
    public private(set) final var value: String?

    /**
      Constructor.

      - parameter type: The document type.
      - parameter value: The document value.
    */
    public init(type: String, value: String) {
        self.type = type
        self.value = value
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
        self.type <- map["type"]
        self.value <- map["value"]
    }

}
