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

    /**
      Mock SwiftClient Request class end method.

      - parameter done: The completion handler.
      - parameter errorHandler: The error handler.
     */
    public override func end(done: (SwiftClient.Response) -> Void, onError errorHandler: ((NSError) -> Void)? = nil) {
        let request = NSMutableURLRequest(URL: NSURL(string: self.mockURL)!)
        request.HTTPMethod = super.method

        switch builder(request) {
            case let .Success(response, data):
               return done(self.transformer(SwiftClient.Response((response as? NSHTTPURLResponse)!, self, data)))

            default:
                return
        }
    }

}
