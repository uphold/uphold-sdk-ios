import Foundation
import ObjectMapper

/// UserSettings model.
public class UserSettings: Mappable {

    /// The currency selected at the user settings.
    public private(set) var currency: String?
    
    /// A boolean indicating if the user have the news subscription enable.
    public private(set) var hasNewsSubscription: Bool?
    
    /// A boolean indicating if the user have the OTP enable.
    public private(set) var hasOtpEnabled: Bool?
    
    /// The user internationalization settings.
    public private(set) var intl: InternationalizationUserSettings?
    
    /// The user theme.
    public private(set) var theme: String?

    /**
        Constructor.
    */
    public init(){
    }
    
    /**
        Constructor.
    
        :param: currency The currency selected at the user settings.
        :param: hasNewsSubscription A boolean indicating if the user have the news subscription enable.
        :param: hasOtpEnabled A boolean indicating if the user have the OTP enable.
        :param: intl The user internationalization settings.
        :param: theme The user theme.
    */
    public init(currency: String, hasNewsSubscription : Bool, hasOtpEnabled : Bool, intl : InternationalizationUserSettings, theme : String) {
        self.currency = currency
        self.hasNewsSubscription = hasNewsSubscription
        self.hasOtpEnabled = hasOtpEnabled
        self.intl = intl
        self.theme = theme
    }
    
    // MARK: Functions required by the ObjectMapper

    /// Returns a Mappable UserSettings.
    public class func newInstance(map: Map) -> Mappable? {
        return UserSettings()
    }

    /// Maps the JSON to the Object.
    public func mapping(map: Map) {
        currency  <- map["currency"]
        hasNewsSubscription  <- map["hasNewsSubscription"]
        hasOtpEnabled  <- map["hasOtpEnabled"]
        intl  <- map["intl"]
        theme  <- map["theme"]
    }

}