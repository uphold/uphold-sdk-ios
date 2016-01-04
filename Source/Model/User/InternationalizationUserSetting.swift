import Foundation
import ObjectMapper

/// InternationalizationUserSetting model.
public class InternationalizationUserSetting: Mappable {

    /// The locale for the setting.
    public private(set) var locale: String?

    /**
      Constructor.

      - parameter locale: The locale for the setting.
    */
    public init(locale: String) {
        self.locale = locale
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
        locale  <- map["locale"]
    }

}
