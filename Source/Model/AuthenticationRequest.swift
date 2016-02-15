import Foundation
import ObjectMapper

/// Authentication request model.
public class AuthenticationRequest: Mappable {

    /// The description for the authentication request.
    public private(set) final var description: String?

    /**
      Constructor.

      - parameter description: The description for the authentication request.
    */
    public init(description: String) {
        self.description = description
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
        self.description <- map["description"]
    }

}
