import XCTest
import UpholdSdk
import ObjectMapper

class TransactionTest: XCTestCase {

    func testTransactionMapperShouldReturnATransaction() {
        let json: String = "{" +
            "\"id\": \"foobar\"," +
            "\"type\": \"transfer\"," +
            "\"message\": \"foobar message\"," +
            "\"status\": \"pending\"," +
            "\"RefundedById\": \"foobiz\"," +
            "\"createdAt\": \"fuz\"," +
            "\"denomination\": {" +
                "\"amount\": \"0.1\"," +
                "\"currency\": \"BTC\"," +
                "\"pair\": \"BTCBTC\"," +
                "\"rate\": \"1.00\"" +
            "}," +
            "\"origin\": {" +
                "\"CardId\": \"fizbiz\"," +
                "\"amount\": \"0.1\"," +
                "\"base\": \"0.1\"," +
                "\"commission\": \"0.00\"," +
                "\"currency\": \"BTC\"," +
                "\"description\": \"Fuz Buz\"," +
                "\"fee\": \"0.00\"," +
                "\"rate\": \"1.00\"," +
                "\"sources\": [{" +
                    "\"id\": \"fizbuz\"," +
                    "\"amount\": \"2.00\"" +
                "}]," +
                "\"type\": \"card\"," +
                "\"username\": \"fuzbuz\"" +
            "}," +
            "\"destination\": {" +
                "\"CardId\": \"fuzbuz\"," +
                "\"amount\": \"0.1\"," +
                "\"base\": \"0.1\"," +
                "\"commission\": \"0.00\"," +
                "\"currency\": \"BTC\"," +
                "\"description\": \"foo@bar.com\"," +
                "\"fee\": \"0.00\"," +
                "\"rate\": \"1.00\"," +
                "\"type\": \"email\"," +
                "\"username\": \"fizbiz\"" +
            "}," +
            "\"params\": {" +
                "\"currency\": \"BTC\"," +
                "\"margin\": \"0.00\"," +
                "\"pair\": \"BTCBTC\"," +
                "\"progress\": \"foo\"," +
                "\"rate\": \"1.00\"," +
                "\"ttl\": 30000," +
                "\"txid\": \"bar\"," +
                "\"type\": \"invite\"" +
            "}," +
            "\"normalized\": [{" +
                "\"amount\": \"14.00\"," +
                "\"commissions\": \"1.20\"," +
                "\"currency\": \"BTC\"," +
                "\"fee\": \"1.00\"," +
                "\"rate\": \"2.345\"" +
            "}]" +
        "}"
        let transaction = Mapper<Transaction>().map(json)

        XCTAssertEqual(transaction!.id!, "foobar", "Failed: Transaction id didn't match.")
        XCTAssertEqual(transaction!.createdAt!, "fuz", "Failed: Transaction createdAt didn't match.")
        XCTAssertEqual(transaction!.denomination!.amount!, "0.1", "Failed: Transaction denomination amount didn't match.")
        XCTAssertEqual(transaction!.denomination!.currency!, "BTC", "Failed: Transaction denomination currency didn't match.")
        XCTAssertEqual(transaction!.denomination!.pair!, "BTCBTC", "Failed: Transaction denomination pair didn't match.")
        XCTAssertEqual(transaction!.denomination!.rate!, "1.00", "Failed: Transaction denomination rate didn't match.")
        XCTAssertEqual(transaction!.destination!.cardId!, "fuzbuz", "Failed: Transaction destination cardId didn't match.")
        XCTAssertEqual(transaction!.destination!.amount!, "0.1", "Failed: Transaction destination amount didn't match.")
        XCTAssertEqual(transaction!.destination!.base!, "0.1", "Failed: Transaction destination base didn't match.")
        XCTAssertEqual(transaction!.destination!.commission!, "0.00", "Failed: Transaction destination commission didn't match.")
        XCTAssertEqual(transaction!.destination!.currency!, "BTC", "Failed: Transaction destination currency didn't match.")
        XCTAssertEqual(transaction!.destination!.description!, "foo@bar.com", "Failed: Transaction destination description didn't match.")
        XCTAssertEqual(transaction!.destination!.fee!, "0.00", "Failed: Transaction destination fee didn't match.")
        XCTAssertEqual(transaction!.destination!.rate!, "1.00", "Failed: Transaction destination rate didn't match.")
        XCTAssertEqual(transaction!.destination!.type!, "email", "Failed: Transaction destination type didn't match.")
        XCTAssertEqual(transaction!.destination!.username!, "fizbiz", "Failed: Transaction destination username didn't match.")
        XCTAssertEqual(transaction!.message!, "foobar message", "Failed: Transaction message didn't match.")
        XCTAssertEqual(transaction!.normalized![0].amount, "14.00", "Failed: Normalized amount didn't match.")
        XCTAssertEqual(transaction!.normalized![0].commissions, "1.20", "Failed: Normalized comission didn't match.")
        XCTAssertEqual(transaction!.normalized![0].currency, "BTC", "Failed: Normalized currency didn't match.")
        XCTAssertEqual(transaction!.normalized![0].fee, "1.00", "Failed: Normalized fee didn't match.")
        XCTAssertEqual(transaction!.normalized![0].rate, "2.345", "Failed: Normalized rate didn't match.")
        XCTAssertEqual(transaction!.origin!.cardId!, "fizbiz", "Failed: Transaction origin cardId didn't match.")
        XCTAssertEqual(transaction!.origin!.amount!, "0.1", "Failed: Transaction origin amount didn't match.")
        XCTAssertEqual(transaction!.origin!.base!, "0.1", "Failed: Transaction origin base didn't match.")
        XCTAssertEqual(transaction!.origin!.commission!, "0.00", "Failed: Transaction origin commission didn't match.")
        XCTAssertEqual(transaction!.origin!.currency!, "BTC", "Failed: Transaction origin currency didn't match.")
        XCTAssertEqual(transaction!.origin!.description!, "Fuz Buz", "Failed: Transaction origin description didn't match.")
        XCTAssertEqual(transaction!.origin!.fee!, "0.00", "Failed: Transaction origin fee didn't match.")
        XCTAssertEqual(transaction!.origin!.rate!, "1.00", "Failed: Transaction origin rate didn't match.")
        XCTAssertEqual(transaction!.origin!.sources!.count, 1, "Failed: Transaction origin type didn't match.")
        XCTAssertEqual(transaction!.origin!.sources![0].id!, "fizbuz", "Failed: Transaction origin type didn't match.")
        XCTAssertEqual(transaction!.origin!.sources![0].amount!, "2.00", "Failed: Transaction origin type didn't match.")
        XCTAssertEqual(transaction!.origin!.type!, "card", "Failed: Transaction origin type didn't match.")
        XCTAssertEqual(transaction!.origin!.username!, "fuzbuz", "Failed: Transaction origin username didn't match.")
        XCTAssertEqual(transaction!.params!.currency, "BTC", "Failed: Transaction parameter currency didn't match.")
        XCTAssertEqual(transaction!.params!.margin, "0.00", "Failed: Transaction parameter margin didn't match.")
        XCTAssertEqual(transaction!.params!.pair, "BTCBTC", "Failed: Transaction parameter pair didn't match.")
        XCTAssertEqual(transaction!.params!.progress, "foo", "Failed: Transaction parameter progress didn't match.")
        XCTAssertEqual(transaction!.params!.rate, "1.00", "Failed: Transaction parameter rate didn't match.")
        XCTAssertEqual(transaction!.params!.ttl, 30000, "Failed: Transaction parameter ttl didn't match.")
        XCTAssertEqual(transaction!.params!.txid, "bar", "Failed: Transaction parameter txid didn't match.")
        XCTAssertEqual(transaction!.params!.type, "invite", "Failed: Transaction parameter txid didn't match.")
        XCTAssertEqual(transaction!.refundedById!, "foobiz", "Failed: Transaction refundedById didn't match.")
        XCTAssertEqual(transaction!.status!, "pending", "Failed: Transaction status didn't match.")
        XCTAssertEqual(transaction!.type!, "transfer", "Failed: Transaction type didn't match.")
    }

}
