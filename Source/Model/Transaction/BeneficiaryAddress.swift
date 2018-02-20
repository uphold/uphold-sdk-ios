import Foundation
import ObjectMapper

/// Beneficiary address model.
public class BeneficiaryAddress: Mappable {

    /// The city.
    public private(set) final var city: String?

    /// The country.
    public private(set) final var country: String?

    /// The line1.
    public private(set) final var line1: String?

    /// The line2.
    public private(set) final var line2: String?

    /// The state.
    public private(set) final var state: String?

    /// The zipCode.
    public private(set) final var zipCode: String?

    /**
      Constructor.

      - parameter city: The city.
      - parameter country: The country.
      - parameter line1: The line1.
      - parameter line2: The line2.
      - parameter state: The state.
      - parameter zipCode: The zipCode.
    */
    public init(city: String, country: String, line1: String, line2: String, state: String, zipCode: String) {
        self.city = city
        self.country = country
        self.line1 = line1
        self.line2 = line2
        self.state = state
        self.zipCode = zipCode
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
        city <- map["city"]
        country <- map["country"]
        line1 <- map["line1"]
        line2 <- map["line2"]
        state <- map["state"]
        zipCode <- map["zipCode"]
    }

}
