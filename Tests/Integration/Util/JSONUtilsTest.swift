import XCTest
import UpholdSdk

/// JSONUtils integration tests.
class JSONUtilsTest: XCTestCase {

    func testToJSONStringShouldReturnTheJSONString() {
        XCTAssertEqual(JSONTestUtils.JSONtoDictionary(JSONUtils.toJSONString(["foo": "bar"])!)!["foo"] as? String, "bar", "Failed: Wrong value.")
        XCTAssertEqual(JSONTestUtils.JSONtoDictionary(JSONUtils.toJSONString(["foo": ["fuz", "bar"]])!)!["foo"]![0] as? String, "fuz", "Failed: Wrong value.")
        XCTAssertEqual(JSONTestUtils.JSONtoDictionary(JSONUtils.toJSONString(["foo": ["fuz", "bar"]])!)!["foo"]![1] as? String, "bar", "Failed: Wrong value.")
        XCTAssertEqual(JSONTestUtils.JSONtoDictionary(JSONUtils.toJSONString(["foo": ["fuz": "bar", "fiz": "biz"]])!)!["foo"]!["fuz"], "bar", "Failed: Wrong value.")
        XCTAssertEqual(JSONTestUtils.JSONtoDictionary(JSONUtils.toJSONString(["foo": ["fuz": "bar", "fiz": "biz"]])!)!["foo"]!["fiz"], "biz", "Failed: Wrong value.")
        XCTAssertEqual(JSONTestUtils.JSONtoDictionary(JSONUtils.toJSONString(["foo": 0])!)!["foo"] as? Int, 0, "Failed: Wrong value.")
        XCTAssertEqual(JSONTestUtils.JSONtoDictionary(JSONUtils.toJSONString(["foo": true])!)!["foo"] as? Bool, true, "Failed: Wrong value.")
    }

}
