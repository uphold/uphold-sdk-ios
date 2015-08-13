import Foundation

/// InternationalizationUserSettings model.
public class InternationalizationUserSettings {
    
    /// The internationalization language user settings.
    public private(set) var language: InternationalizationUserSetting
    
    /// The internationalization date time format user settings.
    public private(set) var dateTimeFormat: InternationalizationUserSetting
    
    /// The internationalization number format user settings.
    public private(set) var numberFormat: InternationalizationUserSetting
    
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

}