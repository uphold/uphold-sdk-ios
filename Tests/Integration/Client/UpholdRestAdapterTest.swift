import XCTest
import ObjectMapper
import PromiseKit
import UpholdSdk
@testable import SwiftClient

/// UpholdRestAdapter integration tests.
class UpholdRestAdapterTest: UpholdTestCase {

    var expectation: XCTestExpectation!

    func testBuildRequestShouldReturnRequest() {
        let mockRequest = MockRequest(body: nil, code: 200, errorHandler: {(error: NSError) -> Void in}, headers: nil, method: "foo")
        let request = UpholdRestAdapter().buildRequest(mockRequest)

        XCTAssertEqual(request.headers["User-Agent"], String(format: "uphold-ios-sdk/%@ (%@)", GlobalConfigurations.UPHOLD_SDK_VERSION, GlobalConfigurations.SDK_GITHUB_URL), "Failed: Wrong headers.")
        XCTAssertEqual(request.method, "foo", "Failed: Wrong method.")
        XCTAssertNil(request.data, "Failed: Wrong body.")
    }

    func testBuildEmptyResponseShouldReturnBadRequestError() {
        self.expectation = expectationWithDescription("REST adapter response.")

        let mockRequest = MockRequest(body: nil, code: 400, errorHandler: {(error: NSError) -> Void in}, headers: nil, method: "foo")
        let request = UpholdRestAdapter().buildRequest(mockRequest)
        let promise: Promise<Response> = UpholdRestAdapter().buildEmptyResponse(request)

        promise.recover { (error: ErrorType) -> Promise<Response> in

            guard let badRequestError = error as? BadRequestError else {
                XCTFail("Error should be BadRequestError.")

                return promise
            }

            XCTAssertEqual(badRequestError.code, 400, "Failed: Wrong response HTTP status code.")
            XCTAssertEqual(badRequestError.info["Bad request error"], "HTTP error 400 - Bad request.", "Failed: Wrong message.")

            self.expectation.fulfill()

            return promise
        }

        wait()
    }

    func testBuildEmptyResponseShouldReturnFulfilledPromise() {
        self.expectation = expectationWithDescription("REST adapter response.")

        let mockRequest = MockRequest(body: nil, code: 200, errorHandler: {(error: NSError) -> Void in}, headers: nil, method: "foo")
        let request = UpholdRestAdapter().buildRequest(mockRequest)
        let promise: Promise<Response> = UpholdRestAdapter().buildEmptyResponse(request)

        promise.then { (response: Response) -> () in
            XCTAssertEqual(response.basicStatus, Response.BasicResponseType.OK, "Failed: Wrong response basic status code.")
            XCTAssertNil(response.text, "Failed: Wrong response body.")

            self.expectation.fulfill()
        }

        wait()
    }

    func testBuildEmptyResponseShouldReturnLogicError() {
        self.expectation = expectationWithDescription("REST adapter response.")

        let mockRequest = MockRequest(body: "foobar", code: 200, errorHandler: {(error: NSError) -> Void in}, headers: nil, method: "foo")
        let request = UpholdRestAdapter().buildRequest(mockRequest)
        let promise: Promise<Response> = UpholdRestAdapter().buildEmptyResponse(request)

        promise.recover { (error: ErrorType) -> Promise<Response> in

            guard let logicError = error as? LogicError else {
                XCTFail("Error should be LogicError.")

                return promise
            }

            XCTAssertEqual(logicError.info, ["Logic error": "Response body should be empty."], "Failed: Wrong error message.")
            XCTAssertNil(logicError.code, "Failed: Wrong response HTTP status code.")

            self.expectation.fulfill()

            return promise
        }

        wait()
    }

    func testBuildResponseShouldReturnBadRequestError() {
        self.expectation = expectationWithDescription("REST adapter response.")

        let jsonRate = "{" +
            "\"ask\":\"1.2\"," +
            "\"bid\":\"1\"," +
            "\"currency\":\"BTC\"," +
            "\"pair\":\"BTCBTC\"" +
        "}"
        let mockRequest = MockRequest(body: jsonRate, code: 400, errorHandler: {(error: NSError) -> Void in}, headers: nil, method: "foo")
        let request = UpholdRestAdapter().buildRequest(mockRequest)
        let promise: Promise<Rate> = UpholdRestAdapter().buildResponse(request)

        promise.recover { (error: ErrorType) -> Promise<Rate> in

            guard let badRequestError = error as? BadRequestError else {
                XCTFail("Error should be BadRequestError.")

                return promise
            }

            XCTAssertEqual(badRequestError.code, 400, "Failed: Wrong response HTTP status code.")
            XCTAssertEqual(badRequestError.info["Bad request error"], "HTTP error 400 - Bad request.", "Failed: Wrong message.")

            self.expectation.fulfill()

            return promise
        }

        wait()
    }

    func testBuildResponseShouldReturnEmptyBodyLogicError() {
        self.expectation = expectationWithDescription("REST adapter response.")

        let mockRequest = MockRequest(body: nil, code: 200, errorHandler: {(error: NSError) -> Void in}, headers: nil, method: "foo")
        let request = UpholdRestAdapter().buildRequest(mockRequest)
        let promise: Promise<Rate> = UpholdRestAdapter().buildResponse(request)

        promise.recover { (error: ErrorType) -> Promise<Rate> in

            guard let logicError = error as? LogicError else {
                XCTFail("Error should be LogicError.")

                return promise
            }

            XCTAssertEqual(logicError.info, ["Logic error": "Response body should not be empty."], "Failed: Wrong error message.")
            XCTAssertNil(logicError.code, "Failed: Wrong response HTTP status code.")

            self.expectation.fulfill()

            return promise
        }

        wait()
    }

    func testBuildResponseShouldReturnFailedMapLogicError() {
        self.expectation = expectationWithDescription("REST adapter response.")

        let jsonRate = "{[" +
            "\"ask\":\"1.2\"," +
            "\"bid\":\"1\"," +
            "\"currency\":\"BTC\"," +
            "\"pair\":\"BTCBTC\"" +
        "}"
        let mockRequest = MockRequest(body: jsonRate, code: 200, errorHandler: {(error: NSError) -> Void in}, headers: nil, method: "foo")
        let request = UpholdRestAdapter().buildRequest(mockRequest)
        let promise: Promise<Rate> = UpholdRestAdapter().buildResponse(request)

        promise.recover { (error: ErrorType) -> Promise<Rate> in

            guard let logicError = error as? LogicError else {
                XCTFail("Error should be LogicError.")

                return promise
            }

            XCTAssertEqual(logicError.info, ["Logic error": "Failed to map the JSON object."], "Failed: Wrong error message.")
            XCTAssertNil(logicError.code, "Failed: Wrong response HTTP status code.")

            self.expectation.fulfill()

            return promise
        }

        wait()
    }

    func testBuildResponseShouldReturnFulfilledPromise() {
        self.expectation = expectationWithDescription("REST adapter response.")

        let jsonRate = "{" +
            "\"ask\":\"1.2\"," +
            "\"bid\":\"1\"," +
            "\"currency\":\"BTC\"," +
            "\"pair\":\"BTCBTC\"" +
        "}"
        let mockRequest = MockRequest(body: jsonRate, code: 200, errorHandler: {(error: NSError) -> Void in}, headers: nil, method: "foo")
        let request = UpholdRestAdapter().buildRequest(mockRequest)
        let promise: Promise<Rate> = UpholdRestAdapter().buildResponse(request)

        promise.then { (rate: Rate) -> () in
            XCTAssertEqual(rate.ask, "1.2", "Failed: Wrong response object attribute.")
            XCTAssertEqual(rate.bid, "1", "Failed: Wrong response object attribute.")
            XCTAssertEqual(rate.currency, "BTC", "Failed: Wrong response object attribute.")
            XCTAssertEqual(rate.pair, "BTCBTC", "Failed: Wrong response object attribute.")

            self.expectation.fulfill()
        }

        wait()
    }

    func testBuildResponseArrayShouldReturnBadRequestError() {
        self.expectation = expectationWithDescription("REST adapter response.")

        let jsonRates = "[{\"ask\":\"1\"}, {\"ask\":\"440.99\"}]"
        let mockRequest = MockRequest(body: jsonRates, code: 400, errorHandler: {(error: NSError) -> Void in}, headers: nil, method: "foo")
        let request = UpholdRestAdapter().buildRequest(mockRequest)
        let promise: Promise<[Rate]> = UpholdRestAdapter().buildResponse(request)

        promise.recover { (error: ErrorType) -> Promise<[Rate]> in

            guard let badRequestError = error as? BadRequestError else {
                XCTFail("Error should be BadRequestError.")

                return promise
            }

            XCTAssertEqual(badRequestError.code, 400, "Failed: Wrong response HTTP status code.")
            XCTAssertEqual(badRequestError.info["Bad request error"], "HTTP error 400 - Bad request.", "Failed: Wrong message.")

            self.expectation.fulfill()

            return promise
        }

        wait()
    }

    func testBuildResponseArrayShouldReturnEmptyBodyLogicError() {
        self.expectation = expectationWithDescription("REST adapter response.")

        let mockRequest = MockRequest(body: nil, code: 200, errorHandler: {(error: NSError) -> Void in}, headers: nil, method: "foo")
        let request = UpholdRestAdapter().buildRequest(mockRequest)
        let promise: Promise<[Rate]> = UpholdRestAdapter().buildResponse(request)

        promise.recover { (error: ErrorType) -> Promise<[Rate]> in

            guard let logicError = error as? LogicError else {
                XCTFail("Error should be LogicError.")

                return promise
            }

            XCTAssertEqual(logicError.info, ["Logic error": "Response body should not be empty."], "Failed: Wrong error message.")
            XCTAssertNil(logicError.code, "Failed: Wrong response HTTP status code.")

            self.expectation.fulfill()

            return promise
        }

        wait()
    }

    func testBuildResponseArrayShouldReturnFailedMapLogicError() {
        self.expectation = expectationWithDescription("REST adapter response.")

        let jsonRates = "[[{\"ask\":\"1\"}, {\"ask\":\"440.99\"}]"
        let mockRequest = MockRequest(body: jsonRates, code: 200, errorHandler: {(error: NSError) -> Void in}, headers: nil, method: "foo")
        let request = UpholdRestAdapter().buildRequest(mockRequest)
        let promise: Promise<[Rate]> = UpholdRestAdapter().buildResponse(request)

        promise.recover { (error: ErrorType) -> Promise<[Rate]> in

            guard let logicError = error as? LogicError else {
                XCTFail("Error should be LogicError.")

                return promise
            }

            XCTAssertEqual(logicError.info, ["Logic error": "Failed to map the JSON object."], "Failed: Wrong error message.")
            XCTAssertNil(logicError.code, "Failed: Wrong response HTTP status code.")

            self.expectation.fulfill()

            return promise
        }

        wait()
    }

    func testBuildResponseArrayShouldReturnFulfilledPromise() {
        self.expectation = expectationWithDescription("REST adapter response.")

        let jsonRates = "[{\"ask\":\"1\"}, {\"ask\":\"440.99\"}]"
        let mockRequest = MockRequest(body: jsonRates, code: 200, errorHandler: {(error: NSError) -> Void in}, headers: nil, method: "foo")
        let request = UpholdRestAdapter().buildRequest(mockRequest)
        let promise: Promise<[Rate]> = UpholdRestAdapter().buildResponse(request)

        promise.then { (rates: [Rate]) -> () in
            XCTAssertEqual(rates.count, 2, "Failed: Wrong response object size.")
            XCTAssertEqual(rates[0].ask, "1", "Failed: Wrong response object attribute.")
            XCTAssertEqual(rates[1].ask, "440.99", "Failed: Wrong response object attribute.")

            self.expectation.fulfill()
        }

        wait()
    }

}
