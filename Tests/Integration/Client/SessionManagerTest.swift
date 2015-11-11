import XCTest
import KeychainSwift
@testable import SwiftClient
@testable import UpholdSdk

/// SessionManager integration tests.
class SessionManagerTest: UpholdTestCase {

    let keychain = KeychainSwift()

    func testGetBearerTokenShouldReturnNil() {
        _ = UpholdClient()

        XCTAssertNil(SessionManager.sharedInstance.getBearerToken(), "Failed: Wrong token.")
    }

    func testGetBearerTokenShouldReturnToken() {
        _ = UpholdClient(token: Token(bearerToken: "foo"))

        guard let token = SessionManager.sharedInstance.getBearerToken() else {
            XCTFail("The bearer token should not be nil.")

            return
        }

        XCTAssertEqual(token, "foo", "Failed: Wrong token.")
    }

    func testInvalidateSessionShouldRemoveToken() {
        let client = UpholdClient(token: Token(bearerToken: "foo"))

        SessionManager.sharedInstance.invalidateSession()

        let request = client.token.adapter.buildRequest(TickerService.getAllTickers())

        XCTAssertNil(request.headers["authorization"], "Failed: Wrong header.")
        XCTAssertNil(SessionManager.sharedInstance.getBearerToken(), "Failed: Wrong token.")
    }

    func testUpholdClientShouldNotSetToken() {
        let client = UpholdClient()
        let request = client.token.adapter.buildRequest(TickerService.getAllTickers())

        XCTAssertNil(request.headers["authorization"], "Failed: Wrong header.")
    }

    func testUpholdClientWithTokenShouldSetToken() {
        let client = UpholdClient(token: Token(bearerToken: "foo"))
        let request = client.token.adapter.buildRequest(TickerService.getAllTickers())

        guard let header = request.headers["authorization"] else {
            XCTFail("Authorization header should not be nil.")

            return
        }

        XCTAssertEqual(header, "Bearer foo", "Failed: Wrong header.")
    }

    override func tearDown() {
        SessionManager.sharedInstance.invalidateSession()
    }

}
