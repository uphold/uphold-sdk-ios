import Foundation
import ObjectMapper

/// Beneficiary model.
public class Beneficiary: Mappable {

    /// The address.
    public private(set) final var address: BeneficiaryAddress?

    /// The name.
    public private(set) final var name: String?

    /// The relationship.
    public private(set) final var relationship: String?

    /**
      Constructor.

      - parameter address: The address.
      - parameter name: The name.
      - parameter relationship: The relationship.
    */
    public init(address: BeneficiaryAddress, name: String, relationship: String) {
        self.address = address
        self.name = name
        self.relationship = relationship
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
    public func mapping(map: Map) {
        address <- map["address"]
        name <- map["name"]
        relationship <- map["relationship"]
    }

}
