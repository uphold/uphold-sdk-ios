import Foundation
import ObjectMapper
import PromiseKit
import UpholdSdk
@testable import SwiftClient

/// Uphold mock REST adapter.
public class MockRestAdapter: UpholdRestAdapter {

    /// The body to inject in the response.
    let body: String

    /**
      Constructor.

      - parameter body: The body to mock the response.
     */
    public init(body: String) {
        self.body = body
    }

    /**
      Mock response builder method.

      - parameter request: The HTTP request.

      - returns: The mock response.
     */
    public override func buildResponse<T : Mappable>(request: Request) -> Promise<T> {
        let mockRequest = MockRequest(body: self.body, code: 200, errorHandler: {(error: NSError) -> Void in}, headers: nil, method: "foo")

        return UpholdRestAdapter().buildResponse(mockRequest)
    }

    /**
      Mock response builder method.

      - parameter request: The HTTP request.

      - returns: The mock response.
     */
    public override func buildResponse<T : Mappable>(request: Request) -> Promise<[T]> {
        let mockRequest = MockRequest(body: self.body, code: 200, errorHandler: {(error: NSError) -> Void in}, headers: nil, method: "foo")

        return UpholdRestAdapter().buildResponse(mockRequest)
    }

}
