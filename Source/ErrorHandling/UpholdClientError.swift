import Foundation
import SwiftClient

/// UpholdClientError error.
public class UpholdClientError: ErrorType, CustomStringConvertible {

    /// The HTTP status code.
    public var code: Int?

    /// The description to be printed when a UpholdClientError occurs.
    public var description: String {
        guard let message = info.values.first else {
            return "Unknown error"
        }

        return message
    }

    /// The error's information being shown to the user.
    public let info: [String: String]

    /// The HTTP response.
    public var response: Response?

    /**
      Constructor.

      - parameter code: The HTTP status code.
      - parameter info: The error's information being shown to the user.
      - parameter response: The HTTP response.
    */
    public init(code: Int?, info: [String: String], response: Response?) {
        self.code = code
        self.info = info
        self.response = response
    }

}
