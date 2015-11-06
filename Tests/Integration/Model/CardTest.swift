import XCTest
import UpholdSdk
import ObjectMapper

class CardTest: XCTestCase {

    func testCardMapperShouldReturnACard() {
        let json: String = "{" +
            "\"address\": {" +
                "\"bitcoin\": \"fuzbuz\"" +
            "}," +
            "\"available\": \"87.52\"," +
            "\"balance\": \"87.52\"," +
            "\"currency\": \"EUR\"," +
            "\"id\": \"foobar\"," +
            "\"label\": \"Foo card\"," +
            "\"lastTransactionAt\": \"foobiz\"," +
            "\"settings\": {" +
                "\"position\": 4," +
                "\"starred\": true" +
            "}," +
            "\"addresses\": [{" +
                "\"id\": \"fiz\"," +
                "\"network\": \"biz\"" +
            "}]," +
            "\"normalized\": [{" +
                "\"available\": \"99.04\"," +
                "\"balance\": \"99.04\"," +
                "\"currency\": \"USD\"" +
            "}]" +
        "}"
        let card = Mapper<Card>().map(json)

        XCTAssertEqual(card!.id!, "foobar", "Failed: Card id didn't match.")
        XCTAssertFalse(card!.address!.isEmpty, "Failed: Address didn't match.")
        XCTAssertEqual(card!.address!.count, 1, "Failed: Address didn't match.")
        XCTAssertEqual(card!.address!["bitcoin"]!, "fuzbuz", "Failed: Address didn't match.")
        XCTAssertEqual(card!.available!, "87.52", "Failed: Available didn't match.")
        XCTAssertEqual(card!.balance!, "87.52", "Failed: Balance didn't match.")
        XCTAssertEqual(card!.currency!, "EUR", "Failed: Currency didn't match.")
        XCTAssertEqual(card!.label!, "Foo card", "Failed: Label didn't match.")
        XCTAssertEqual(card!.lastTransactionAt!, "foobiz", "Failed: LastTransactionAt didn't match.")
        XCTAssertEqual(card!.normalized!.count, 1, "Failed: Normalized didn't match.")
        XCTAssertEqual(card!.normalized![0].available!, "99.04", "Failed: Available didn't match.")
        XCTAssertEqual(card!.normalized![0].balance!, "99.04", "Failed: Balance didn't match.")
        XCTAssertEqual(card!.normalized![0].currency!, "USD", "Failed: Currency didn't match.")
        XCTAssertEqual(card!.settings!.position!, 4, "Failed: Position didn't match.")
        XCTAssertTrue(card!.settings!.starred!, "Failed: Starred didn't match.")
    }

}
