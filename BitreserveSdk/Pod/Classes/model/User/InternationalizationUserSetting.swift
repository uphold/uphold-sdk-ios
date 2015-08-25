import Foundation
import ObjectMapper

/// InternationalizationUserSetting model.
public class InternationalizationUserSetting: Mappable {

    /// The locale for the setting.
    public private(set) var locale: String?

    /**
        Constructor.
    */
    public init(){
    }
    
    /**
        Constructor.
    
        :param: locale The locale for the setting.
    */
    public init(locale: String) {
        self.locale = locale
    }

    // MARK: Functions required by the ObjectMapper

    /// Returns a Mappable InternationalizationUserSetting.
    public class func newInstance(map: Map) -> Mappable? {
        return InternationalizationUserSetting()
    }

    /// Maps the JSON to the Object.
    public func mapping(map: Map) {
        locale  <- map["locale"]
    }

}