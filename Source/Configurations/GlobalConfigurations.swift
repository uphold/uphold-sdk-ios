import Foundation

/// The global SDK configurations class.
public class GlobalConfigurations {

    /// Uphold's Swift SDK bundle name.
    public static let BUNDLE_NAME: String = NSBundle.mainBundle().bundleIdentifier == nil ? "com.uphold.uphold-swift-sdk" : NSBundle.mainBundle().bundleIdentifier!

    /// Uphold's Swift SDK github repository URL.
    public static let SDK_GITHUB_URL: String = "https://github.com/uphold/uphold-sdk-ios"

    /// Uphold's Swift SDK current version.
    public static let UPHOLD_SDK_VERSION: String = ResourcesUtil.getValueFromInfoPlist("CFBundleShortVersionString")

    /// Uphold's API URL.
    public static let UPHOLD_API_URL: String = ResourcesUtil.getValueFromConfigurationsPlist("API_URL")

    /// Uphold's authorization server URL.
    public static let UPHOLD_AUTHORIZATION_SERVER_URL: String = ResourcesUtil.getValueFromConfigurationsPlist("AUTHORIZATION_SERVER_URL")

}
