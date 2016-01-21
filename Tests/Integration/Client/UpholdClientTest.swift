import XCTest
import ObjectMapper
import PromiseKit
@testable import UpholdSdk
@testable import SwiftClient

/// UpholdClient integration tests.
class UpholdClientTest: UpholdTestCase {

    func testCompleteAuthorizationShouldReturnEmptyCodeError() {
        let authenticationResponse = AuthenticationResponse(accessToken: "foo", expiresIn: 1234, scope: "foobar", tokenType: "bar")
        let authorizationViewController = AuthorizationViewController(URL: NSURL(string: "http://foo.bar")!, entersReaderIfAvailable: false)
        let client = UpholdClient()
        let expectation = expectationWithDescription("Uphold client authorization test.")
        client.token.adapter = MockRestAdapter(body: Mapper().toJSONString(authenticationResponse)!)

        client.completeAuthorization(authorizationViewController, clientId: "foo", clientSecret: "bar", grantType: "foobiz", state: "foobar", uri: NSURL(string: "uphold://foobar.com?state=foobar")!).error { (error: ErrorType) -> Void in
            guard let error = error as? UnexpectedResponseError else {
                XCTFail("Error should be UnexpectedResponseError.")

                return
            }

            XCTAssertNil(error.code, "Failed: Wrong code.")
            XCTAssertEqual(error.description, "URL query parameter code should not be nil.", "Failed: Wrong message.")

            expectation.fulfill()
        }

        wait()
    }

    func testCompleteAuthorizationShouldReturnEmptyStateError() {
        let authenticationResponse = AuthenticationResponse(accessToken: "foo", expiresIn: 1234, scope: "foobar", tokenType: "bar")
        let authorizationViewController = AuthorizationViewController(URL: NSURL(string: "http://foo.bar")!, entersReaderIfAvailable: false)
        let client = UpholdClient()
        let expectation = expectationWithDescription("Uphold client authorization test.")
        client.token.adapter = MockRestAdapter(body: Mapper().toJSONString(authenticationResponse)!)

        client.completeAuthorization(authorizationViewController, clientId: "foo", clientSecret: "bar", grantType: "foobiz", state: "foobar", uri: NSURL(string: "uphold://foobar.com?code=foo")!).error { (error: ErrorType) -> Void in
            guard let error = error as? UnexpectedResponseError else {
                XCTFail("Error should be UnexpectedResponseError.")

                return
            }

            XCTAssertNil(error.code, "Failed: Wrong code.")
            XCTAssertEqual(error.description, "URL query parameter state should not be nil.", "Failed: Wrong message.")

            expectation.fulfill()
        }

        wait()
    }

    func testCompleteAuthorizationShouldReturnTheAuthenticationResponse() {
        let authenticationResponse = AuthenticationResponse(accessToken: "foo", expiresIn: 1234, scope: "foobar", tokenType: "bar")
        let authorizationViewController = AuthorizationViewController(URL: NSURL(string: "http://foo.bar")!, entersReaderIfAvailable: false)
        let client = UpholdClient()
        let expectation = expectationWithDescription("Uphold client authorization test.")
        client.token.adapter = MockRestAdapter(body: Mapper().toJSONString(authenticationResponse)!)

        client.completeAuthorization(authorizationViewController, clientId: "foo", clientSecret: "bar", grantType: "foobiz", state: "foobar", uri: NSURL(string: "uphold://foobar.com?code=foo&state=foobar")!).then { (authenticationResponse: AuthenticationResponse) -> () in

            XCTAssertEqual(authenticationResponse.accessToken, "foo", "Failed: Wrong access token.")
            XCTAssertEqual(authenticationResponse.expiresIn, 1234, "Failed: Wrong expiration time.")
            XCTAssertEqual(authenticationResponse.scope, "foobar", "Failed: Wrong scope.")
            XCTAssertEqual(authenticationResponse.tokenType, "bar", "Failed: Wrong token type.")

            expectation.fulfill()
        }

        wait()
    }

    func testGetTickersShouldReturnTheArrayOfTickers() {
        let expectation = expectationWithDescription("Uphold client test.")
        let json: String = "[{" +
            "\"ask\": \"foo\"," +
            "\"bid\": \"bar\"," +
            "\"currency\": \"foobar\"," +
            "\"pair\": \"foobiz\"" +
        "}, {" +
            "\"ask\": \"fiz\"," +
            "\"bid\": \"biz\"," +
            "\"currency\": \"foobiz\"," +
            "\"pair\": \"bar\"" +
        "}, {" +
            "\"ask\": \"foobar\"," +
            "\"bid\": \"foobaz\"," +
            "\"currency\": \"bar\"," +
            "\"pair\": \"foo\"" +
        "}]"
        let client = UpholdClient()
        client.token.adapter = MockRestAdapter(body: json)

        client.getTickers().then { (rates: [Rate]) -> () in
            XCTAssertEqual(rates.count, 3, "Failed: Wrong response object size.")
            XCTAssertEqual(rates[0].ask, "foo", "Failed: Wrong response object attribute.")
            XCTAssertEqual(rates[0].bid, "bar", "Failed: Wrong response object attribute.")
            XCTAssertEqual(rates[0].currency, "foobar", "Failed: Wrong response object attribute.")
            XCTAssertEqual(rates[0].pair, "foobiz", "Failed: Wrong response object attribute.")
            XCTAssertEqual(rates[1].ask, "fiz", "Failed: Wrong response object attribute.")
            XCTAssertEqual(rates[1].bid, "biz", "Failed: Wrong response object attribute.")
            XCTAssertEqual(rates[1].currency, "foobiz", "Failed: Wrong response object attribute.")
            XCTAssertEqual(rates[1].pair, "bar", "Failed: Wrong response object attribute.")
            XCTAssertEqual(rates[2].ask, "foobar", "Failed: Wrong response object attribute.")
            XCTAssertEqual(rates[2].bid, "foobaz", "Failed: Wrong response object attribute.")
            XCTAssertEqual(rates[2].currency, "bar", "Failed: Wrong response object attribute.")
            XCTAssertEqual(rates[2].pair, "foo", "Failed: Wrong response object attribute.")

            expectation.fulfill()
        }

        wait()
    }

    func testGetTickersByCurrencyShouldReturnTheArrayOfTickers() {
        let expectation = expectationWithDescription("Uphold client test.")
        let json: String = "[{" +
            "\"ask\": \"foo\"," +
            "\"bid\": \"bar\"," +
            "\"currency\": \"foobar\"," +
            "\"pair\": \"foobiz\"" +
        "}, {" +
            "\"ask\": \"fiz\"," +
            "\"bid\": \"biz\"," +
            "\"currency\": \"foobiz\"," +
            "\"pair\": \"bar\"" +
        "}, {" +
            "\"ask\": \"foobar\"," +
            "\"bid\": \"foobaz\"," +
            "\"currency\": \"bar\"," +
            "\"pair\": \"foo\"" +
        "}]"
        let client = UpholdClient()
        client.token.adapter = MockRestAdapter(body: json)

        client.getTickersByCurrency("USD").then { (rates: [Rate]) -> () in
            XCTAssertEqual(rates.count, 3, "Failed: Wrong response object size.")
            XCTAssertEqual(rates[0].ask, "foo", "Failed: Wrong response object attribute.")
            XCTAssertEqual(rates[1].ask, "fiz", "Failed: Wrong response object attribute.")
            XCTAssertEqual(rates[2].ask, "foobar", "Failed: Wrong response object attribute.")

            expectation.fulfill()
        }

        wait()
    }

}
