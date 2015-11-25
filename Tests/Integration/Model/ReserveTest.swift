import XCTest
import ObjectMapper
import PromiseKit
@testable import UpholdSdk
@testable import SwiftClient

/// Reserve integration tests.
class ReserveTest: UpholdTestCase {

    func testGetLedgerShouldReturnTheArrayWithDeposits() {
        let expectation = expectationWithDescription("Reserve test.")
        let json: String = "[{" +
            "\"type\": \"foo\"," +
            "\"out\": {" +
                "\"amount\": \"foobar\"," +
                "\"currency\": \"fuz\"" +
            "}," +
            "\"in\": {" +
                "\"amount\": \"foobiz\"," +
                "\"currency\": \"fiz\"" +
            "}," +
            "\"createdAt\": \"2015-04-20T14:57:12.398Z\"" +
        "},{" +
            "\"type\": \"bar\"," +
            "\"out\": {" +
                "\"amount\": \"foobiz\"," +
                "\"currency\": \"buz\"" +
            "}," +
            "\"in\": {" +
                "\"amount\": \"foobar\"," +
                "\"currency\": \"biz\"" +
            "}," +
            "\"TransactionId\": \"foobar\"," +
            "\"createdAt\": \"2015-04-21T14:57:12.398Z\"" +
        "}]"
        let reserve = UpholdClient().getReserve()
        reserve.adapter = MockRestAdapter(body: json)

        reserve.getLedger(0, end: 5).then { (deposits: [Deposit]) -> () in
            XCTAssertEqual(deposits[0].createdAt, "2015-04-20T14:57:12.398Z", "Failed: DepositMovement in currency didn't match.")
            XCTAssertEqual(deposits[0].input?.amount, "foobiz", "Failed: DepositMovement in amount didn't match.")
            XCTAssertEqual(deposits[0].input?.currency, "fiz", "Failed: DepositMovement in currency didn't match.")
            XCTAssertEqual(deposits[0].output?.amount, "foobar", "Failed: DepositMovement out amount didn't match.")
            XCTAssertEqual(deposits[0].output?.currency, "fuz", "Failed: DepositMovement out currency didn't match.")
            XCTAssertEqual(deposits[0].type, "foo", "Failed: Deposit type didn't match.")
            XCTAssertEqual(deposits[1].createdAt, "2015-04-21T14:57:12.398Z", "Failed: CreatedAt didn't match.")
            XCTAssertEqual(deposits[1].input?.amount, "foobar", "Failed: DepositMovement in amount didn't match.")
            XCTAssertEqual(deposits[1].input?.currency, "biz", "Failed: DepositMovement in currency didn't match.")
            XCTAssertEqual(deposits[1].output?.amount, "foobiz", "Failed: DepositMovement out amount didn't match.")
            XCTAssertEqual(deposits[1].output?.currency, "buz", "Failed: DepositMovement out currency didn't match.")
            XCTAssertEqual(deposits[1].transactionId, "foobar", "Failed: TransactionId didn't match.")
            XCTAssertEqual(deposits[1].type, "bar", "Failed: Deposit type didn't match.")

            expectation.fulfill()
        }

        wait()
    }

    func testGetStatisticsShouldReturnTheListWithReserveStatistics() {
        let expectation = expectationWithDescription("Reserve test.")
        let json: String = "[{" +
            "\"currency\": \"FOO\"," +
            "\"values\": [{" +
                "\"assets\": \"foobar\"," +
                "\"currency\": \"foo\"," +
                "\"liabilities\": \"bar\"," +
                "\"rate\": \"biz\"" +
            "}]," +
            "\"totals\": {" +
                "\"commissions\": \"foo\"," +
                "\"transactions\": \"bar\"," +
                "\"assets\": \"foobar\"," +
                "\"liabilities\": \"foobiz\"" +
            "}" +
        "}, {" +
            "\"currency\": \"BAR\"," +
            "\"values\": [{" +
                "\"assets\": \"foobiz\"," +
                "\"currency\": \"biz\"," +
                "\"liabilities\": \"buz\"," +
                "\"rate\": \"foo\"" +
            "}]," +
            "\"totals\": {" +
                "\"commissions\": \"fiz\"," +
                "\"transactions\": \"biz\"," +
                "\"assets\": \"fuz\"," +
                "\"liabilities\": \"buz\"" +
            "}" +
        "}]"
        let reserve = UpholdClient().getReserve()
        reserve.adapter = MockRestAdapter(body: json)

        reserve.getStatistics().then { (statistics: [ReserveStatistics]) -> () in
            XCTAssertEqual(statistics[0].currency, "FOO", "Failed: Currency didn't match.")
            XCTAssertEqual(statistics[0].totals?.assets, "foobar", "Failed: Totals assets didn't match.")
            XCTAssertEqual(statistics[0].totals?.commissions, "foo", "Failed: Totals comissions didn't match.")
            XCTAssertEqual(statistics[0].totals?.transactions, "bar", "Failed: Totals transactions didn't match.")
            XCTAssertEqual(statistics[0].totals?.liabilities, "foobiz", "Failed: Totals liabilities didn't match.")
            XCTAssertEqual(statistics[0].values?.first?.assets, "foobar", "Failed: Values assests didn't match.")
            XCTAssertEqual(statistics[0].values?.first?.currency, "foo", "Failed: Values currency didn't match.")
            XCTAssertEqual(statistics[0].values?.first?.liabilities, "bar", "Failed: Values liabilities didn't match.")
            XCTAssertEqual(statistics[0].values?.first?.rate, "biz", "Failed: Values rate didn't match.")
            XCTAssertEqual(statistics[1].currency, "BAR", "Failed: Currency didn't match.")
            XCTAssertEqual(statistics[1].totals?.assets, "fuz", "Failed: Totals assets didn't match.")
            XCTAssertEqual(statistics[1].totals?.commissions, "fiz", "Failed: Totals comissions didn't match.")
            XCTAssertEqual(statistics[1].totals?.transactions, "biz", "Failed: Totals transactions didn't match.")
            XCTAssertEqual(statistics[1].totals?.liabilities, "buz", "Failed: Totals liabilities didn't match.")
            XCTAssertEqual(statistics[1].values?.first?.assets, "foobiz", "Failed: Values assests didn't match.")
            XCTAssertEqual(statistics[1].values?.first?.currency, "biz", "Failed: Values currency didn't match.")
            XCTAssertEqual(statistics[1].values?.first?.liabilities, "buz", "Failed: Values liabilities didn't match.")
            XCTAssertEqual(statistics[1].values?.first?.rate, "foo", "Failed: Values rate didn't match.")

            expectation.fulfill()
        }

        wait()
    }

    func testGetTransactionsByIdShouldReturnTheTransaction() {
        let expectation = expectationWithDescription("Reserve test.")
        let json: String = "{ \"id\": \"foobar\" }"
        let reserve = UpholdClient().getReserve()
        reserve.adapter = MockRestAdapter(body: json)

        reserve.getTransactionById("foobar").then { (transaction: Transaction) -> () in
            XCTAssertEqual(transaction.id, "foobar", "Failed: TransactionId didn't match.")

            expectation.fulfill()
        }

        wait()
    }

    func testGetTransactionsShouldReturnTheListOfTransactions() {
        let expectation = expectationWithDescription("Reserve test.")
        let json: String = "[{ \"id\": \"foobar\" }, { \"id\": \"foobiz\" }]"
        let reserve = UpholdClient().getReserve()
        reserve.adapter = MockRestAdapter(body: json)

        reserve.getTransactions(0, end: 5).then { (transaction: [Transaction]) -> () in
            XCTAssertEqual(transaction.first?.id, "foobar", "Failed: TransactionId didn't match.")
            XCTAssertEqual(transaction.last?.id, "foobiz", "Failed: TransactionId didn't match.")

            expectation.fulfill()
        }

        wait()
    }

}
