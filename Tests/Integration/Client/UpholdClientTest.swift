import XCTest
import ObjectMapper
import PromiseKit
@testable import UpholdSdk
@testable import SwiftClient

/// UpholdClient integration tests.
class UpholdClientTest: UpholdTestCase {

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
