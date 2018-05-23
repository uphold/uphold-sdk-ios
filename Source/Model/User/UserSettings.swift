import Foundation
import ObjectMapper

/// UserSettings model.
open class UserSettings: Mappable {

    /// The user's default currency.
    open private(set) var currency: String?

    /// A boolean indicating if the user has the marketing consent enabled.
    open private(set) var hasMarketingConsent: Bool?

    /// A boolean indicating if the user has the news subscription enabled.
    open private(set) var hasNewsSubscription: Bool?

    /// The user internationalization settings.
    public private(set) final var intl: InternationalizationUserSettings?

    /// The user otp settings.
    public private(set) final var otp: Otp?

    /// The user theme.
    public private(set) final var theme: String?

    /**
      Constructor.

      - parameter currency: The user's default currency.
      - parameter hasMarketingConsent: A boolean indicating if the user has the marketing consent enabled.
      - parameter hasNewsSubscription: A boolean indicating if the user has the news subscription enabled.
      - parameter intl: The user internationalization settings.
      - parameter otp: The user otp settings.
      - parameter theme: The user theme.
    */
    public init(currency: String, hasMarketingConsent: Bool, hasNewsSubscription: Bool, intl: InternationalizationUserSettings, otp: Otp, theme: String) {
        self.currency = currency
        self.hasNewsSubscription = hasNewsSubscription
        self.intl = intl
        self.otp = otp
        self.theme = theme
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
    open func mapping(map: Map) {
        currency  <- map["currency"]
        hasMarketingConsent  <- map["hasMarketingConsent"]
        hasNewsSubscription  <- map["hasNewsSubscription"]
        intl  <- map["intl"]
        otp  <- map["otp"]
        theme  <- map["theme"]
    }

}
