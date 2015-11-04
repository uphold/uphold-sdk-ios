import Foundation
import Mockingjay
import UpholdSdk
@testable import SwiftClient

/// MockRequest test util.
public class MockRequest: Request {

    /// The mock request HTTP status code.
    let code: Int

    /// The mock request URL.
    let mockURL: String = "http://foobar.com"

    /**
      Constructor.

      - parameter body: The request body.
      - parameter code: The HTTP status code.
      - parameter errorHandler: The errorHandler method.
      - parameter headers: The request headers.
      - parameter method: The HTTP method.
    */
    init(body: String?, code: Int, errorHandler: (NSError) -> Void, headers: [String: String]?, method: String) {
        self.code = code

        super.init(method, mockURL, errorHandler)

        if let body = body {
            super.data = body
        }

        if let headers = headers {
            super.headers = headers
        }

    }

    /**
      Mock response builder method.

      - parameter request: The mock request.

      - returns: The mock response.
    */
    func builder(request: NSURLRequest) -> Mockingjay.Response {
        let response = NSHTTPURLResponse(URL: request.URL!, statusCode: self.code, HTTPVersion: nil, headerFields: super.headers)!

        guard let body = super.data else {
            return .Success(response, nil)
        }

        return .Success(response, body.dataUsingEncoding(NSUTF8StringEncoding))
    }

    /// Mocked SwiftClient Request class end method.
    public override func end(done: (SwiftClient.Response) -> Void, onError errorHandler: ((NSError) -> Void)? = nil) {
        let request = NSMutableURLRequest(URL: NSURL(string: self.mockURL)!)
        request.HTTPMethod = super.method
        let response = builder(request)
        let stubError = NSError(domain: "Stub error", code: -1, userInfo: ["Stub error": "Could not create stub."])

        switch response {
            case let .Success(response, data):
                guard let mockResponse = response as? NSHTTPURLResponse else {
                    errorHandler!(stubError)

                    return
                }

                done(self.transformer(SwiftClient.Response(mockResponse, self, data)))

                break
            default:
                errorHandler!(stubError)

                break
        }
    }

}
