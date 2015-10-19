import Foundation
import SwiftClient

/// Header util class.
public class Header {

    /**
      Gets the default headers.

      - returns: The default headers.
    */
    public static func getDefaultHeaders() -> [String: String] {
        let headers: [String: String] = ["User-Agent": String(format: "uphold-ios-sdk/%@ (%@)", GlobalConfigurations.UPHOLD_SDK_VERSION, GlobalConfigurations.SDK_GITHUB_URL)]

        return headers
    }

    /**
      Gets the rate limit value.

      - parameter headers: The response headers.

      - returns: The rate limit value.
    */
    public static func getRateLimitValue(headers: [String: String]) -> String? {
        guard let rateLimit = headers["x-ratelimit-limit"] else {
            return nil
        }

        return rateLimit
    }

    /**
      Gets the rate limit reset time.

      - parameter headers: The response headers.

      - returns: The rate limit reset time.
    */
    public static func getSecondsUntilRateLimitReset(headers: [String: String]) -> String? {
        guard let resetTime = headers["retry-after"] else {
            return nil
        }

        return resetTime
    }

}
