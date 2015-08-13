import Foundation

/// User model.
public class User {
    
    /// The user country.
    public private(set) var country: String
    
    /// The user list of currencies.
    public private(set) var currencies: [String]
    
    /// The user email.
    public private(set) var email: String
    
    /// The user first name.
    public private(set) var firstName: String
    
    /// The user last name.
    public private(set) var lastName: String
    
    /// The user name.
    public private(set) var name: String
    
    /// The user settings.
    public private(set) var settings: UserSettings
    
    /// The user state.
    public private(set) var state: String
    
    /// The user status.
    public private(set) var status: String
    
    /// The user username.
    public private(set) var username: String
    
    /**
        Constructor.
    
        :param: country The user country.
        :param: currencies The user list of currencies.
        :param: email The user email.
        :param: firstName The user first name.
        :param: lastName The user last name.
        :param: name The user name.
        :param: settings The user settings.
        :param: state The user state.
        :param: status The user status.
        :param: username The user username.
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
    
}