import Foundation
import SwiftClient

/// LogicError error.
public class LogicError: UpholdClientError {

    /**
    Constructor.

    - parameter code: The HTTP status code.
    - parameter message: The error message being shown to the user.
    - parameter response: The HTTP response.
    */
    public init(code: Int?, message: String) {
        let info: [String: String] = ["Logic error": message]

        super.init(code: code, info: info, response: nil)
    }

}
