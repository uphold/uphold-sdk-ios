import XCTest
@testable import BitreserveSdk
@testable import SwiftClient

/// UserService integration tests.
class UserServiceTest: XCTestCase {

    func testCreateContactShouldReturnTheRequest() {
        let request = UserService.createContact("foo")

        XCTAssertEqual(request.url, "https://api.bitreserve.org/v0/me/contacts",  "Failed: Wrong URL.")
        XCTAssertEqual(request.method, "POST", "Failed: Wrong method.")
        XCTAssertEqual(request.data! as? String, "foo", "Failed: Wrong body.")
    }

    func testGetUserShouldReturnTheRequest() {
        let request = UserService.getUser()

        XCTAssertEqual(request.url, "https://api.bitreserve.org/v0/me", "Failed: Wrong URL.")
        XCTAssertEqual(request.method, "GET", "Failed: Wrong method.")
    }

    func testGetUserBalancesShouldReturnTheRequest() {
        let request = UserService.getUserBalances()

        XCTAssertEqual(request.url, "https://api.bitreserve.org/v0/me", "Failed: Wrong URL.")
        XCTAssertEqual(request.method, "GET", "Failed: Wrong method.")
    }

    func testGetUserContactsShouldReturnTheRequest() {
        let request = UserService.getUserContacts()

        XCTAssertEqual(request.url, "https://api.bitreserve.org/v0/me/contacts", "Failed: Wrong URL.")
        XCTAssertEqual(request.method, "GET", "Failed: Wrong method.")
    }

    func testGetUserPhonesShouldReturnTheRequest() {
        let request = UserService.getUserPhones()

        XCTAssertEqual(request.url, "https://api.bitreserve.org/v0/me/phones", "Failed: Wrong URL.")
        XCTAssertEqual(request.method, "GET", "Failed: Wrong method.")
    }

    func testGetUserTransactionsShouldReturnTheRequest() {
        let request = UserService.getUserTransactions("foo")

        XCTAssertEqual(request.url, "https://api.bitreserve.org/v0/me/transactions", "Failed: Wrong URL.")
        XCTAssertEqual(request.method, "GET", "Failed: Wrong method.")
        XCTAssertNotNil(request.headers["Range"], "Failed: Range header doesn't exist.")
        XCTAssertEqual(request.headers["Range"]!, "foo", "Failed: Range value doesn't match.")
    }

    func testUpdateUserShouldReturnTheRequest() {
        let request = UserService.updateUser("foo")

        XCTAssertEqual(request.url, "https://api.bitreserve.org/v0/me", "Failed: Wrong URL.")
        XCTAssertEqual(request.method, "PATCH", "Failed: Wrong method.")
        XCTAssertEqual(request.data! as? String, "foo", "Failed: Wrong body.")
    }

}
