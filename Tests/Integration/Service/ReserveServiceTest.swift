import XCTest
@testable import BitreserveSdk
@testable import SwiftClient

/// ReserveService integration tests.
class ReserveServiceTest: XCTestCase {

    func testGetLedgerShouldReturnTheRequest() {
        let request = ReserveService.getLedger("foo")

        XCTAssertEqual(request.url, "https://api.bitreserve.org/v0/reserve/ledger",  "Failed: Wrong URL.")
        XCTAssertEqual(request.method, "GET", "Failed: Wrong method.")
        XCTAssertNotNil(request.headers["Range"], "Failed: Range header doesn't exist.")
        XCTAssertEqual(request.headers["Range"]!, "foo", "Failed: Range value doesn't match.")
    }

    func testGetReserveTransactionByIdShouldReturnTheRequest() {
        let request = ReserveService.getReserveTransactionById("foo")

        XCTAssertEqual(request.url, "https://api.bitreserve.org/v0/reserve/transactions/foo",  "Failed: Wrong URL.")
        XCTAssertEqual(request.method, "GET", "Failed: Wrong method.")
    }

    func testGetReserveTransactionsShouldReturnTheRequest() {
        let request = ReserveService.getReserveTransactions("foo")

        XCTAssertEqual(request.url, "https://api.bitreserve.org/v0/reserve/transactions",  "Failed: Wrong URL.")
        XCTAssertEqual(request.method, "GET", "Failed: Wrong method.")
        XCTAssertNotNil(request.headers["Range"], "Failed: Range header doesn't exist.")
        XCTAssertEqual(request.headers["Range"]!, "foo", "Failed: Range value doesn't match.")
    }

    func testGetStatisticsShouldReturnTheRequest() {
        let request = ReserveService.getStatistics()

        XCTAssertEqual(request.url, "https://api.bitreserve.org/v0/reserve/statistics",  "Failed: Wrong URL.")
        XCTAssertEqual(request.method, "GET", "Failed: Wrong method.")
    }

}
