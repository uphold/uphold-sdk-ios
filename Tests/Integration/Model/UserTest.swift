import XCTest
import UpholdSdk
import ObjectMapper

class UserTest: XCTestCase {

    func testUserMapperShouldReturnAUser() {
        let user = Mapper<User>().map("{\"country\":\"US\",\"currencies\":[\"BTC\"],\"email\":\"foo@bar.org\",\"firstName\":\"Foo\",\"lastName\":\"Bar\",\"name\":\"Foo Bar\",\"settings\":{\"currency\":\"USD\",\"hasOtpEnabled\":true,\"hasNewsSubscription\":true,\"intl\":{\"dateTimeFormat\":{\"locale\":\"foo\"},\"language\":{\"locale\":\"bar\"},\"numberFormat\":{\"locale\":\"biz\"}},\"theme\":\"vintage\"},\"state\":\"WA\",\"status\":\"ok\",\"username\":\"foobar\"}")

        XCTAssertEqual(user!.country!, "US", "Failed: User country didn't match.")
        XCTAssertEqual(user!.currencies!.count, 1, "Failed: User currencies didn't match.")
        XCTAssertEqual(user!.currencies![0], "BTC", "Failed: User currencies didn't match.")
        XCTAssertEqual(user!.email!, "foo@bar.org", "Failed: User email didn't match.")
        XCTAssertEqual(user!.firstName!, "Foo", "Failed: User first name didn't match.")
        XCTAssertEqual(user!.lastName!, "Bar", "Failed: User last name didn't match.")
        XCTAssertEqual(user!.name!, "Foo Bar", "Failed: User name didn't match.")
        XCTAssertEqual(user!.settings!.currency!, "USD", "Failed: User settings currency didn't match.")
        XCTAssertTrue(user!.settings!.hasNewsSubscription!, "Failed: User settings hasNewsSubscription didn't match.")
        XCTAssertTrue(user!.settings!.hasOtpEnabled!, "Failed: User settings hasOtpEnabled didn't match.")
        XCTAssertEqual(user!.settings!.intl!.dateTimeFormat!.locale!, "foo", "Failed: User settings intl dateTimeFormat didn't match.")
        XCTAssertEqual(user!.settings!.intl!.language!.locale!, "bar", "Failed: User settings intl language didn't match.")
        XCTAssertEqual(user!.settings!.intl!.numberFormat!.locale!, "biz", "Failed: User settings intl numberFormat didn't match.")
        XCTAssertEqual(user!.settings!.theme!, "vintage", "Failed: User settings theme didn't match.")
        XCTAssertEqual(user!.state!, "WA", "Failed: User name didn't match.")
        XCTAssertEqual(user!.status!, "ok", "Failed: User name didn't match.")
        XCTAssertEqual(user!.username!, "foobar", "Failed: User name didn't match.")
    }

}
