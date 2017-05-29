import Foundation
import ObjectMapper

/// Phone model.
public class Phone: Mappable {

    /// The contact id.
    public private(set) final var id: String?

    /// The E.164 phone mask.
    public private(set) final var e164Masked: String?

    /// A boolean indicating if the phone is the primary user phone.
    public private(set) final var primary: Bool?

    /// A boolean indicating if the phone is verified.
    public private(set) final var verified: Bool?

    /**
      Constructor.

      - parameter id: The contact id.
      - parameter e164Masked: The E.164 phone mask.
      - parameter primary: A boolean indicating if the phone is the primary user phone.
      - parameter verified: A boolean indicating if the phone is verified.
    */
    public init(id: String, e164Masked: String, primary: Bool, verified: Bool) {
        self.id = id
        self.e164Masked = e164Masked
        self.primary = primary
        self.verified = verified
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
        self.id <- map["id"]
        self.e164Masked <- map["e164Masked"]
        self.primary <- map["primary"]
        self.verified <- map["verified"]
    }

}
