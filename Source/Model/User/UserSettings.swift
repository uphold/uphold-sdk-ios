import Foundation
import ObjectMapper

/// UserSettings model.
public class UserSettings: Mappable {

    /// The user's default currency.
    public private(set) var currency: String?

    /// A boolean indicating if the user has the news subscription enabled.
    public private(set) var hasNewsSubscription: Bool?

    /// A boolean indicating if the user has OTP enabled.
    public private(set) var hasOtpEnabled: Bool?

    /// The user internationalization settings.
    public private(set) var intl: InternationalizationUserSettings?

    /// The user theme.
    public private(set) var theme: String?

    /**
      Constructor.

      - parameter currency: The user's default currency.
      - parameter hasNewsSubscription: A boolean indicating if the user has the news subscription enabled.
      - parameter hasOtpEnabled: A boolean indicating if the user has OTP enabled.
      - parameter intl: The user internationalization settings.
      - parameter theme: The user theme.
    */
    public init(currency: String, hasNewsSubscription: Bool, hasOtpEnabled: Bool, intl: InternationalizationUserSettings, theme: String) {
        self.currency = currency
        self.hasNewsSubscription = hasNewsSubscription
        self.hasOtpEnabled = hasOtpEnabled
        self.intl = intl
        self.theme = theme
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
        currency  <- map["currency"]
        hasNewsSubscription  <- map["hasNewsSubscription"]
        hasOtpEnabled  <- map["hasOtpEnabled"]
        intl  <- map["intl"]
        theme  <- map["theme"]
    }

}
