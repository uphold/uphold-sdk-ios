import XCTest
import UpholdSdk

/// Resources util integration tests.
class ResourcesUtilTest: XCTestCase {

    /// The SwiftLint rules that must be disabled.
    // swiftlint:disable force_try

    func testGetValueFromKeyShouldReturnTheValue() {
        XCTAssertNotNil(try! ResourcesUtil.getValueFromKey("ConfigurationsPlist", key: "API_URL"), "Failed: Getting resource value failed.")
        XCTAssertNotNil(try! ResourcesUtil.getValueFromKey("InfoPlist", key: "CFBundleShortVersionString"), "Failed: Getting resource value failed.")

        do {
            let _ = try ResourcesUtil.getValueFromKey("", key: "foobar")

            XCTFail("Error should be ConfigurationMissingError.")
        } catch let error as ConfigurationMissingError {
            XCTAssertEqual(error.description, "There is no value for the key: foobar", "Failed: Getting resource value failed.")
        } catch _ {
            XCTFail("Error should be ConfigurationMissingError.")
        }
    }

}
