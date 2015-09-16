import Foundation

/// UserSettings model.
public class UserSettings {

    /// The currency selected at the user settings.
    public private(set) var currency: String
    
    /// A boolean indicating if the user have the news subscription enable.
    public private(set) var hasNewsSubscription: Boolean
    
    /// A boolean indicating if the user have the OTP enable.
    public private(set) var hasOtpEnabled: Boolean
    
    /// The user internationalization settings.
    public private(set) var intl: InternationalizationUserSettings
    
    /// The user theme.
    public private(set) var theme: String
    
    /**
        Constructor.
    
        :param: currency The currency selected at the user settings.
        :param: hasNewsSubscription A boolean indicating if the user have the news subscription enable.
        :param: hasOtpEnabled A boolean indicating if the user have the OTP enable.
        :param: intl The user internationalization settings.
        :param: theme The user theme.
    */
    public init(currency: String, hasNewsSubscription : Boolean, hasOtpEnabled : Boolean, intl : InternationalizationUserSettings, theme : String) {
        self.currency = currency
        self.hasNewsSubscription = hasNewsSubscription
        self.hasOtpEnabled = hasOtpEnabled
        self.intl = intl
        self.theme = theme
    }
    
}