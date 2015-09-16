import Foundation
import ObjectMapper

/// InternationalizationUserSettings model.
public class InternationalizationUserSettings: Mappable {
    
    /// The internationalization language user settings.
    public private(set) var language: InternationalizationUserSetting?
    
    /// The internationalization date time format user settings.
    public private(set) var dateTimeFormat: InternationalizationUserSetting?
    
    /// The internationalization number format user settings.
    public private(set) var numberFormat: InternationalizationUserSetting?

    /**
        Constructor.
    */
    public init() {
    }
    
    /**
        Constructor.
    
        :param: language The internationalization language user settings.
        :param: dateTimeFormat The internationalization date time format user settings.
        :param: numberFormat The internationalization number format user settings.
    */
    public init(language: InternationalizationUserSetting, dateTimeFormat: InternationalizationUserSetting, numberFormat: InternationalizationUserSetting) {
        self.language = language
        self.dateTimeFormat = dateTimeFormat
        self.numberFormat = numberFormat
    }

    // MARK: Functions required by the ObjectMapper

    /// Returns a Mappable InternationalizationUserSettings.
    public class func newInstance(map: Map) -> Mappable? {
        return InternationalizationUserSettings()
    }

    /// Maps the JSON to the Object.
    public func mapping(map: Map) {
        language  <- map["language"]
        dateTimeFormat <- map["dateTimeFormat"]
        numberFormat <- map["numberFormat"]
    }

}