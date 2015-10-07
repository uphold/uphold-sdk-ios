import XCTest
@testable import BitreserveSdk
@testable import SwiftClient

/// TickerService integration tests.
class TickerServiceTest: XCTestCase {

    func testGetAllTickersShouldReturnTheRequest() {
        let request = TickerService.getAllTickers()

        XCTAssertEqual(request.url, "https://api.bitreserve.org/v0/ticker",  "Failed: Wrong URL")
        XCTAssertEqual(request.method, "GET", "Failed: Wrong method.")
    }
    
    func testGetAllTickersByCurrencyShouldReturnTheRequest() {
        let request = TickerService.getAllTickersByCurrency("foo")
        
        XCTAssertEqual(request.url, "https://api.bitreserve.org/v0/ticker/foo",  "Failed: Wrong URL")
        XCTAssertEqual(request.method, "GET", "Failed: Wrong method.")
    }
    
}
