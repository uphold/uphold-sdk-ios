import Foundation
import ObjectMapper
import PromiseKit
import SwiftClient

/// Uphold REST adapter.
public class UpholdRestAdapter {

    /**
      Constructor.
     */
    public init() {
    }

    /**
      Builds the HTTP request with the headers data.

      - parameter request: The HTTP request.

      - returns: The configured HTTP request.
    */
    public func buildRequest(request: Request) -> Request {
        request.set(Header.getDefaultHeaders())

        return request
    }

    /**
      Handles responses that should have empty bodies.

      - parameter request: The HTTP request.

      - returns: A promise of Response.
    */
    public func buildEmptyResponse(request: Request) -> Promise<Response> {
        return Promise { fulfill, reject in
            request.end({ (response: Response) -> Void in
                if (response.basicStatus != Response.BasicResponseType.OK) {
                    reject(UpholdClientErrorHandling.handleError(response))

                    return
                }

                guard let _ = response.text else {
                    fulfill(response)

                    return
                }

                reject(LogicError(code: nil, message: "Response body should be empty."))
                }, onError: { (error: NSError) -> Void in
                    reject(error)
            })
        }
    }

    /**
      Maps the JSON from the HTTP response to a T object.

      - parameter request: The HTTP request.

      - returns: A promise of T object.
    */
    public func buildResponse<T: Mappable>(request: Request) -> Promise<T> {
        return Promise { fulfill, reject in
            request.end({ (response: Response) -> Void in
                if (response.basicStatus != Response.BasicResponseType.OK) {
                    reject(UpholdClientErrorHandling.handleError(response))

                    return
                }

                guard let body = response.text else {
                    reject(LogicError(code: nil, message: "Response body should not be empty."))

                    return
                }

                guard let object: T = Mapper<T>().map(body) else {
                    reject(LogicError(code: nil, message: "Failed to map the JSON object."))

                    return
                }

                fulfill(object)
                }) { (error: NSError) -> Void in
                    reject(error)
            }
        }
    }

    /**
      Maps the JSON from the HTTP response to an array of T object.

      - parameter request: The HTTP request.

      - returns: A promise of an array of T objects.
    */
    public func buildResponse<T: Mappable>(request: Request) -> Promise<[T]> {
        return Promise { fulfill, reject in
            request.end({ (response: Response) -> Void in
                if (response.basicStatus != Response.BasicResponseType.OK) {
                    reject(UpholdClientErrorHandling.handleError(response))

                    return
                }

                guard let body = response.text else {
                    reject(LogicError(code: nil, message: "Response body should not be empty."))

                    return
                }

                guard let object: [T] = Mapper<T>().mapArray(body) else {
                    reject(LogicError(code: nil, message: "Failed to map the JSON object."))

                    return
                }

                fulfill(object)
                }) { (error: NSError) -> Void in
                    reject(error)
            }
        }
    }

}
