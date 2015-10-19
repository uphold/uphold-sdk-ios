import XCTest
@testable import SwiftClient
@testable import UpholdSdk

/// UserCardService integration tests.
class UserCardServiceTest: XCTestCase {

    func testCancelTransactionShouldReturnTheRequest() {
        let request = UserCardService.cancelTransaction("bar", transactionId: "foo")

        XCTAssertEqual(request.url, "https://api.uphold.com/v0/me/cards/bar/transactions/foo/cancel",  "Failed: Wrong URL.")
        XCTAssertEqual(request.method, "GET", "Failed: Wrong method.")
    }

    func testConfirmTransactionShouldReturnTheRequest() {
        let request = UserCardService.confirmTransaction("bar", transactionId: "foo", message: "foobar")

        XCTAssertEqual(request.url, "https://api.uphold.com/v0/me/cards/bar/transactions/foo/commit",  "Failed: Wrong URL.")
        XCTAssertEqual(request.method, "POST", "Failed: Wrong method.")
        XCTAssertEqual(request.data! as? String, "foobar", "Failed: Wrong body.")
    }

    func testCreateTransactionShouldReturnTheRequest() {
        let request = UserCardService.createTransaction("bar", transactionId: "foo", transactionRequest: "foobar")

        XCTAssertEqual(request.url, "https://api.uphold.com/v0/me/cards/bar/transactions/foo/commit",  "Failed: Wrong URL.")
        XCTAssertEqual(request.method, "POST", "Failed: Wrong method.")
        XCTAssertEqual(request.data! as? String, "foobar", "Failed: Wrong body.")
    }

    func testCreateUserCardShouldReturnTheRequest() {
        let request = UserCardService.createUserCard("foo")

        XCTAssertEqual(request.url, "https://api.uphold.com/v0/me/cards",  "Failed: Wrong URL.")
        XCTAssertEqual(request.method, "POST", "Failed: Wrong method.")
        XCTAssertEqual(request.data! as? String, "foo", "Failed: Wrong body.")
    }

    func testGetUserCardByIdShouldReturnTheRequest() {
        let request = UserCardService.getUserCardById("foo")

        XCTAssertEqual(request.url, "https://api.uphold.com/v0/me/cards/foo",  "Failed: Wrong URL.")
        XCTAssertEqual(request.method, "GET", "Failed: Wrong method.")
    }

    func testGetUserCardsShouldReturnTheRequest() {
        let request = UserCardService.getUserCards()

        XCTAssertEqual(request.url, "https://api.uphold.com/v0/me/cards",  "Failed: Wrong URL.")
        XCTAssertEqual(request.method, "GET", "Failed: Wrong method.")
    }

    func testGetUserCardTransactionsShouldReturnTheRequest() {
        let request = UserCardService.getUserCardTransactions("bar", range: "foo")

        XCTAssertEqual(request.url, "https://api.uphold.com/v0/me/cards/bar/transactions",  "Failed: Wrong URL.")
        XCTAssertEqual(request.method, "GET", "Failed: Wrong method.")
        XCTAssertNotNil(request.headers["Range"], "Failed: Range header doesn't exist.")
        XCTAssertEqual(request.headers["Range"]!, "foo", "Failed: Range value doesn't match.")
    }

    func testUpdateCardShouldReturnTheRequest() {
        let request = UserCardService.updateCard("bar", updateFields: "foo")

        XCTAssertEqual(request.url, "https://api.uphold.com/v0/me/cards/bar",  "Failed: Wrong URL.")
        XCTAssertEqual(request.method, "PATCH", "Failed: Wrong method.")
        XCTAssertEqual(request.data! as? String, "foo", "Failed: Wrong body.")
    }
}
