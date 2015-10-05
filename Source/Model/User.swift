import Foundation
import ObjectMapper

/// User model.
public class User: Mappable {

    /// The user country.
    public private(set) var country: String?

    /// The user's list of currencies.
    public private(set) var currencies: [String]?

    /// The user email.
    public private(set) var email: String?

    /// The user first name.
    public private(set) var firstName: String?

    /// The user last name.
    public private(set) var lastName: String?

    /// The user name.
    public private(set) var name: String?

    /// The user's settings.
    public private(set) var settings: UserSettings?

    /// The user state.
    public private(set) var state: String?

    /// The user status.
    public private(set) var status: String?

    /// The user username.
    public private(set) var username: String?

    /**
      Constructor.

      - parameter country: The user country.
      - parameter currencies: The user list of currencies.
      - parameter email: The user email.
      - parameter firstName: The user first name.
      - parameter lastName: The user last name.
      - parameter name: The user name.
      - parameter settings: The user settings.
      - parameter state: The user state.
      - parameter status: The user status.
      - parameter username: The user username.
    */
    public init(country : String, currencies : [String], email : String, firstName : String, lastName : String, name : String, settings : UserSettings, state : String, status : String, username : String) {
        self.country = country
        self.currencies = currencies
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.name = name
        self.settings = settings
        self.state = state
        self.status = status
        self.username = username
    }

    // MARK: Required by the ObjectMapper.

    /**
      Constructor.
    */
    required public init?(_ map: Map) {
    }

    /// Maps the JSON to the Object.
    public func mapping(map: Map) {
        self.country <- map["country"]
        self.currencies <- map["currencies"]
        self.email <- map["email"]
        self.firstName <- map["firstName"]
        self.lastName <- map["lastName"]
        self.name <- map["name"]
        self.settings <- map["settings"]
        self.state <- map["state"]
        self.status <- map["status"]
        self.username <- map["username"]
    }

}
