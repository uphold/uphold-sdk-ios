import Foundation

/// Resources util class.
public class ResourcesUtil {

    /// The SwiftLint rules that must be disabled.
    // swiftlint:disable force_try

    /**
      Gets the value of a given key and configuration file.

      - parameter file: The configuration file.
      - parameter key: The configuration key.

      - throws: A ConfigurationMissingError.

      - returns: The configuration value.
    */
    public static func getValueFromKey(file: String, key: String) throws -> String {
        switch file {
            case "ConfigurationsPlist":
                guard let configurationsPath = NSBundle(forClass: self).pathForResource("Configurations", ofType: "plist"), configurationDictionary = NSDictionary(contentsOfFile: configurationsPath), value = configurationDictionary[key] as? String else {
                    throw ConfigurationMissingError(message: String(format: "There is no value for the key: %@", key))
                }

                return value
            case "InfoPlist":
                guard let infoDictionary = NSBundle(forClass: self).infoDictionary, value = infoDictionary[key] as? String else {
                    throw ConfigurationMissingError(message: String(format: "There is no value for the key: %@", key))
                }

                return value
            default:
                throw ConfigurationMissingError(message: String(format: "There is no value for the key: %@", key))
        }
    }

    /**
      Gets the value of a given key from the Configurations.plist file.

      - parameter key: The configuration key.

      - returns: The configuration value.
    */
    public static func getValueFromConfigurationsPlist(key: String) -> String {
        return try! ResourcesUtil.getValueFromKey("ConfigurationsPlist", key: key)
    }

    /**
      Gets the value of a given key from the Info.plist file.

      - parameter key: The configuration key.

      - returns: The configuration value.
    */
    public static func getValueFromInfoPlist(key: String) -> String {
        return try! ResourcesUtil.getValueFromKey("InfoPlist", key: key)
    }

}
