import Foundation
import Mockingjay
import UpholdSdk
@testable import SwiftClient

/// MockRequest test util.
public class MockRequest: Request {

    /// The mock request body.
    let body: String

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
    init(body: String, code: Int, errorHandler: (NSError) -> Void, headers: [String: String]?, method: String) {
        self.body = body
        self.code = code

        super.init(method, mockURL, errorHandler)

        guard let headers = headers else {
            return
        }

        super.headers = headers
    }

    /**
      Mock response builder method.

      - parameter request: The mock request.

      - returns: The mock response.
    */
    func builder(request: NSURLRequest) -> Mockingjay.Response {
        let data: NSData? = nil
        let response = NSHTTPURLResponse(URL: request.URL!, statusCode: self.code, HTTPVersion: nil, headerFields: super.headers)!

        return .Success(response, data)
    }

    /// Mocked SwiftClient Request class end method.
    public override func end(done: (SwiftClient.Response) -> Void, onError errorHandler: ((NSError) -> Void)? = nil) {
        let request = NSMutableURLRequest(URL: NSURL(string: self.mockURL)!)
        let response = builder(request)
        let stubError = NSError(domain: "Stub error", code: -1, userInfo: ["Stub error": "Could not create stub."])

        request.HTTPBody = stringToData(self.body)
        request.HTTPMethod = super.method

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
