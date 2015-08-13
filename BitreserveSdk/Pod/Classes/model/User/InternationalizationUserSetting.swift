import Foundation

/// InternationalizationUserSetting model.
public class InternationalizationUserSetting {

    /// The locale for the setting.
    public private(set) var locale: String
    
    /**
        Constructor.
    
        :param: locale The locale for the setting.
    */
    public init(locale: String) {
        self.locale = locale
    }

}