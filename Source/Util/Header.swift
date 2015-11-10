import Foundation
import SwiftClient

/// Header util class.
public class Header {

    /**
     Builds a string with the range header.

     - parameter start: The position of the first element.
     - parameter end: The position of the last element.

     - returns: The string with the header value.
     */
    public static func buildRangeHeader(start: Int, end: Int) -> String {
        return String(format: "items=%i-%i", start, end)
    }

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
