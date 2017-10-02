import Foundation
import ObjectMapper

/// Denomination model.
public class Merchant: Mappable {

    /// The city of the merchant.
    public private(set) final var city: String?

    /// The country of the merchant.
    public private(set) final var country: String?

    /// The name of the merchant.
    public private(set) final var name: String?

    /// The state of the merchant.
    public private(set) final var state: String?

    /// The zip code of the merchant.
    public private(set) final var zipCode: String?

    /**
      Constructor.

      - parameter city: The city of the merchant.
      - parameter country: The country of the merchant.
      - parameter name: The name of the merchant.
      - parameter state: The state of the merchant.
      - parameter zipCode: The zipCode of the merchant.
    */
    public init(city: String, country: String, name: String, state: String, zipCode: String) {
        self.city = city
        self.country = country
        self.name = name
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
        name <- map["name"]
        state <- map["state"]
        zipCode <- map["zipCode"]
    }

}
