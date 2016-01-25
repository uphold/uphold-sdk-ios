import XCTest
@testable import SwiftClient
@testable import UpholdSdk

/// OAuth2 service integration tests.
class OAuth2ServiceTest: XCTestCase {

    func testRequestTokenShouldReturnTheToken() {
        let request = OAuth2Service.requestToken("foo", clientSecret: "bar", code: "foobar", grantType: "foobiz")
        let loginData: NSData = "foo:bar".dataUsingEncoding(NSUTF8StringEncoding)!
        let base64LoginString = loginData.base64EncodedStringWithOptions([])

        XCTAssertEqual(request.url, String(format: "%@/oauth2/token", GlobalConfigurations.UPHOLD_API_URL), "Failed: Wrong URL.")
        XCTAssertEqual(request.headers["authorization"], String(format: "Basic %@", base64LoginString), "Failed: Wrong method.")
        XCTAssertEqual(request.method, "POST", "Failed: Wrong method.")
        XCTAssertEqual(request.data! as? String, "code=foobar&grant_type=foobiz", "Failed: Wrong body.")
    }

}
