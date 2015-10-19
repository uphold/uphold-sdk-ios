import XCTest
@testable import SwiftClient
@testable import UpholdSdk

/// TickerService integration tests.
class TickerServiceTest: XCTestCase {

    func testGetAllTickersShouldReturnTheRequest() {
        let request = TickerService.getAllTickers()

        XCTAssertEqual(request.url, "https://api.uphold.com/v0/ticker",  "Failed: Wrong URL")
        XCTAssertEqual(request.method, "GET", "Failed: Wrong method.")
    }

    func testGetAllTickersByCurrencyShouldReturnTheRequest() {
        let request = TickerService.getAllTickersByCurrency("foo")

        XCTAssertEqual(request.url, "https://api.uphold.com/v0/ticker/foo",  "Failed: Wrong URL")
        XCTAssertEqual(request.method, "GET", "Failed: Wrong method.")
    }

}
