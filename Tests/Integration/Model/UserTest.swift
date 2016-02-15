import XCTest
import ObjectMapper
import PromiseKit
@testable import UpholdSdk

/// User integration tests.
class UserTest: UpholdTestCase {

    func testGetBalancesByCurrencyShouldReturnTheCurrencyBalance() {
        let expectation = expectationWithDescription("User test: get balances by currency.")
        let json: String = "{" +
            "\"balances\": {" +
                "\"total\": \"1083.77\"," +
                "\"currencies\": {" +
                    "\"CNY\": {" +
                        "\"amount\": \"6.98\"," +
                        "\"balance\": \"42.82\"," +
                        "\"currency\": \"USD\"," +
                        "\"rate\": \"6.13880\"" +
                    "}," +
                    "\"BTC\": {" +
                        "\"amount\": \"2.98\"," +
                        "\"balance\": \"890.82\"," +
                        "\"currency\": \"USD\"," +
                        "\"rate\": \"300.14202\"" +
                    "}," +
                    "\"EUR\": {" +
                        "\"amount\": \"75.01\"," +
                        "\"balance\": \"58.05\"," +
                        "\"currency\": \"EUR\"," +
                        "\"rate\": \"1.29220\"" +
                    "}" +
                "}" +
            "}" +
        "}"
        let user: User = Fixtures.loadUser()
        user.adapter = MockRestAdapter(body: json)

        user.getBalanceByCurrency("EUR").then { (currency: Currency) -> () in
            XCTAssertEqual(currency.amount, "75.01", "Failed: Wrong currency amount.")
            XCTAssertEqual(currency.balance, "58.05", "Failed: Wrong currency balance.")
            XCTAssertEqual(currency.currency, "EUR", "Failed: Wrong currency.")
            XCTAssertEqual(currency.rate, "1.29220", "Failed: Wrong currency.")

            expectation.fulfill()
        }

        wait()
    }

    func testGetBalancesByCurrencyShouldReturnCurrencyDoesNotExistError() {
        let expectation = expectationWithDescription("User test: get balances by currency.")
        let json: String = "{" +
            "\"balances\": {" +
                "\"total\": \"1083.77\"," +
                "\"currencies\": {" +
                    "\"CNY\": {" +
                        "\"amount\": \"6.98\"," +
                        "\"balance\": \"42.82\"," +
                        "\"currency\": \"USD\"," +
                        "\"rate\": \"6.13880\"" +
                    "}," +
                    "\"EUR\": {" +
                        "\"amount\": \"75.01\"," +
                        "\"balance\": \"58.05\"," +
                        "\"currency\": \"EUR\"," +
                        "\"rate\": \"1.29220\"" +
                    "}" +
                "}" +
            "}" +
        "}"
        let user: User = Fixtures.loadUser()
        user.adapter = MockRestAdapter(body: json)

        user.getBalanceByCurrency("USD").error { (error: ErrorType) -> Void in
            guard let error = error as? LogicError else {
                XCTFail("Error should be LogicError.")

                return
            }

            XCTAssertNil(error.code, "Failed: Wrong code.")
            XCTAssertEqual(error.description, "Currency does not exist.", "Failed: Wrong message.")

            expectation.fulfill()
        }

        wait()
    }

    func testGetBalancesByCurrencyShouldReturnEmptyBalancesError() {
        let expectation = expectationWithDescription("User test: get balances by currency.")
        let user: User = Fixtures.loadUser()
        user.adapter = MockRestAdapter(body: "{}")

        user.getBalanceByCurrency("EUR").error { (error: ErrorType) -> Void in
            guard let error = error as? UnexpectedResponseError else {
                XCTFail("Error should be UnexpectedResponseError.")

                return
            }

            XCTAssertNil(error.code, "Failed: HTTP status code should be nil.")
            XCTAssertEqual(error.description, "Balances should not be nil.", "Failed: Wrong message.")

            expectation.fulfill()
        }

        wait()
    }

    func testGetBalancesByCurrencyShouldReturnEmptyCurrenciesError() {
        let expectation = expectationWithDescription("User test: get balances by currency.")
        let user: User = Fixtures.loadUser()
        user.adapter = MockRestAdapter(body: "{\"balances\": {} }")

        user.getBalanceByCurrency("EUR").error { (error: ErrorType) -> Void in
            guard let error = error as? UnexpectedResponseError else {
                XCTFail("Error should be UnexpectedResponseError.")

                return
            }

            XCTAssertNil(error.code, "Failed: HTTP status code should be nil.")
            XCTAssertEqual(error.description, "Currencies should not be nil.", "Failed: Wrong message.")

            expectation.fulfill()
        }

        wait()
    }

    func testGetBalancesShouldReturnTheArrayOfBalances() {
        let expectation = expectationWithDescription("User test: get balances.")
        let json: String = "{" +
            "\"balances\": {" +
                "\"total\": \"1083.77\"," +
                "\"currencies\": {" +
                    "\"CNY\": {" +
                        "\"amount\": \"6.98\"" +
                    "}," +
                    "\"BTC\": {" +
                        "\"amount\": \"2.45\"" +
                    "}," +
                    "\"EUR\": {" +
                        "\"amount\": \"75.01\"" +
                    "}" +
                "}" +
            "}" +
        "}"
        let user: User = Fixtures.loadUser()
        user.adapter = MockRestAdapter(body: json)

        user.getBalances().then { (currencies: [Currency]) -> () in
            XCTAssertEqual(currencies.count, 3, "Failed: Wrong number of currencies.")
            XCTAssertEqual(currencies[0].amount, "2.45", "Failed: Wrong currency amount.")
            XCTAssertEqual(currencies[1].amount, "6.98", "Failed: Wrong currency amount.")
            XCTAssertEqual(currencies[2].amount, "75.01", "Failed: Wrong currency amount.")

            expectation.fulfill()
        }

        wait()
    }

    func testGetBalancesShouldReturnEmptyBalancesError() {
        let expectation = expectationWithDescription("User test: get balances by currency.")
        let user: User = Fixtures.loadUser()
        user.adapter = MockRestAdapter(body: "{}")

        user.getBalances().error { (error: ErrorType) -> Void in
            guard let error = error as? UnexpectedResponseError else {
                XCTFail("Error should be UnexpectedResponseError.")

                return
            }

            XCTAssertNil(error.code, "Failed: HTTP status code should be nil.")
            XCTAssertEqual(error.description, "Balances should not be nil.", "Failed: Wrong message.")

            expectation.fulfill()
        }

        wait()
    }

    func testGetBalancesShouldReturnEmptyCurrenciesError() {
        let expectation = expectationWithDescription("User test: get balances by currency.")
        let user: User = Fixtures.loadUser()
        user.adapter = MockRestAdapter(body: "{\"balances\": {} }")

        user.getBalances().error { (error: ErrorType) -> Void in
            guard let error = error as? UnexpectedResponseError else {
                XCTFail("Error should be UnexpectedResponseError.")

                return
            }

            XCTAssertNil(error.code, "Failed: HTTP status code should be nil.")
            XCTAssertEqual(error.description, "Currencies should not be nil.", "Failed: Wrong message.")

            expectation.fulfill()
        }

        wait()
    }

    func testGetCardsByCurrencyShouldReturnTheArrayOfCardsWithCurrency() {
        let cards: [Card] = [Fixtures.loadCard(["id": "foobar", "currency": "USD"]), Fixtures.loadCard(["id": "foobiz", "currency": "BTC"]), Fixtures.loadCard(["id": "fuzbuz", "currency": "BTC"])]
        let expectation = expectationWithDescription("User test: get cards by currency.")
        let user: User = Fixtures.loadUser()
        user.adapter = MockRestAdapter(body: Mapper().toJSONString(cards)!)

        user.getCardsByCurrency("BTC").then { (cards: [Card]) -> () in
            XCTAssertEqual(cards.count, 2, "Failed: Wrong number of card objects.")
            XCTAssertEqual(cards[0].id, "foobiz", "Failed: Wrong card object.")
            XCTAssertEqual(cards[0].currency, "BTC", "Failed: Wrong card currency.")
            XCTAssertEqual(cards[1].id, "fuzbuz", "Failed: Wrong card object.")
            XCTAssertEqual(cards[1].currency, "BTC", "Failed: Wrong card currency.")

            expectation.fulfill()
        }

        wait()
    }

    func testGetCardsByCurrencyShouldReturnUnmatchedCurrencyError() {
        let expectation = expectationWithDescription("User test: get balances by currency.")
        let user: User = Fixtures.loadUser()
        user.adapter = MockRestAdapter(body: Mapper().toJSONString(Fixtures.loadCard(["id": "foobar", "currency": "BTC"]))!)

        user.getCardsByCurrency("USD").error { (error: ErrorType) -> Void in
            guard let error = error as? LogicError else {
                XCTFail("Error should be LogicError.")

                return
            }

            XCTAssertNil(error.code, "Failed: Wrong code.")
            XCTAssertEqual(error.description, "There are no cards in the given currency.", "Failed: Wrong message.")

            expectation.fulfill()
        }

        wait()
    }

    func testGetCardByIdShouldReturnTheCard() {
        let card: Card = Fixtures.loadCard(["id": "foobar"])
        let expectation = expectationWithDescription("User test: get card by id.")
        let user: User = Fixtures.loadUser()
        user.adapter = MockRestAdapter(body: Mapper().toJSONString(card)!)

        user.getCardById("foobar").then { (card: Card) -> () in
            XCTAssertEqual(card.id, "foobar", "Failed: Wrong card object.")

            expectation.fulfill()
        }

        wait()
    }

    func testGetCardsShouldReturnTheArrayOfCards() {
        let cards: [Card] = [Fixtures.loadCard(["id": "foo"]), Fixtures.loadCard(["id": "bar"])]
        let expectation = expectationWithDescription("User test: get cards.")
        let user: User = Fixtures.loadUser()
        user.adapter = MockRestAdapter(body: Mapper().toJSONString(cards)!)

        user.getCards().then { (cards: [Card]) -> () in
            XCTAssertEqual(cards[0].id, "foo", "Failed: Wrong card object.")
            XCTAssertEqual(cards[1].id, "bar", "Failed: Wrong card object.")

            expectation.fulfill()
        }

        wait()
    }

    func testGetContactsShouldReturnTheListOfContacts() {
        let expectation = expectationWithDescription("User test: get contacts.")
        let json: String = "[{" +
            "\"id\": \"foobar\"," +
            "\"firstName\": \"Foo\"," +
            "\"lastName\": \"Bar\"," +
            "\"company\": \"biz\"," +
            "\"emails\": [" +
                "\"foo@bar.org\"" +
            "]," +
            "\"addresses\": [\"FooBar FooBiz\"]," +
            "\"name\": \"Foo Bar\"" +
            "}, {" +
            "\"id\": \"fizbar\"," +
            "\"firstName\": \"Fuz\"," +
            "\"lastName\": \"Buz\"," +
            "\"company\": \"fiz\"," +
            "\"emails\": [" +
                "\"fuzbuz@buz.org\"" +
            "]," +
            "\"addresses\": [\"FizBiz FooBiz\"]," +
            "\"name\": \"Fuz Buz\"" +
        "}]"
        let user: User = Fixtures.loadUser()
        user.adapter = MockRestAdapter(body: json)

        user.getContacts().then { (contact: [Contact]) -> () in
            XCTAssertEqual(contact.count, 2, "Failed: Wrong number of contacts objects.")
            XCTAssertEqual(contact[0].addresses!.count, 1, "Failed: Wrong number of addresses.")
            XCTAssertEqual(contact[0].addresses![0], "FooBar FooBiz", "Failed: Wrong contact object.")
            XCTAssertEqual(contact[0].company, "biz", "Failed: Wrong contact object.")
            XCTAssertEqual(contact[0].emails!.count, 1, "Failed: Wrong contact object.")
            XCTAssertEqual(contact[0].emails![0], "foo@bar.org", "Failed: Wrong contact object.")
            XCTAssertEqual(contact[0].firstName, "Foo", "Failed: Wrong contact object.")
            XCTAssertEqual(contact[0].id, "foobar", "Failed: Wrong contact object.")
            XCTAssertEqual(contact[0].lastName, "Bar", "Failed: Wrong contact object.")
            XCTAssertEqual(contact[0].name, "Foo Bar", "Failed: Wrong contact object.")
            XCTAssertEqual(contact[1].addresses!.count, 1, "Failed: Wrong number of addresses.")
            XCTAssertEqual(contact[1].addresses![0], "FizBiz FooBiz", "Failed: Wrong contact object.")
            XCTAssertEqual(contact[1].company, "fiz", "Failed: Wrong contact object.")
            XCTAssertEqual(contact[1].emails!.count, 1, "Failed: Wrong contact object.")
            XCTAssertEqual(contact[1].emails![0], "fuzbuz@buz.org", "Failed: Wrong contact object.")
            XCTAssertEqual(contact[1].firstName, "Fuz", "Failed: Wrong contact object.")
            XCTAssertEqual(contact[1].id, "fizbar", "Failed: Wrong contact object.")
            XCTAssertEqual(contact[1].lastName, "Buz", "Failed: Wrong contact object.")
            XCTAssertEqual(contact[1].name, "Fuz Buz", "Failed: Wrong contact object.")

            expectation.fulfill()
        }

        wait()
    }

    func testGetPhonesShouldReturnTheListOfPhones() {
        let expectation = expectationWithDescription("User test: get phones.")
        let json: String = "[{" +
            "\"id\": \"foobar\"," +
            "\"verified\": true," +
            "\"primary\": true," +
            "\"e164Masked\": \"+XXXXXXXXX04\"," +
            "\"nationalMasked\": \"(XXX) XXX-XX04\"," +
            "\"internationalMasked\": \"+X XXX-XXX-XX04\"" +
        "}]"
        let user: User = Fixtures.loadUser()
        user.adapter = MockRestAdapter(body: json)

        user.getPhones().then { (phones: [Phone]) -> () in
            XCTAssertEqual(phones.count, 1, "Failed: Wrong number of phone objects.")
            XCTAssertEqual(phones[0].e164Masked, "+XXXXXXXXX04", "Failed: Wrong phone e164Masked field.")
            XCTAssertEqual(phones[0].id, "foobar", "Failed: Wrong phone id.")
            XCTAssertEqual(phones[0].internationalMasked, "+X XXX-XXX-XX04", "Failed: Wrong phone internationalMasked field.")
            XCTAssertEqual(phones[0].nationalMasked, "(XXX) XXX-XX04", "Failed: Wrong phone nationalMasked field.")
            XCTAssertTrue(phones[0].primary!, "Failed: Wrong phone primary field.")
            XCTAssertTrue(phones[0].verified!, "Failed: Wrong phone verified field.")

            expectation.fulfill()
        }

        wait()
    }

    func testGetTotalBalancesShouldReturnTheTotalBalance() {
        let expectation = expectationWithDescription("User test: get total balances.")
        let json: String = "{" +
            "\"balances\": {" +
                "\"total\": \"1083.77\"," +
                "\"currencies\": {" +
                    "\"CNY\": {" +
                        "\"amount\": \"6.98\"," +
                        "\"balance\": \"42.82\"," +
                        "\"currency\": \"USD\"," +
                        "\"rate\": \"6.13880\"" +
                    "}," +
                    "\"EUR\": {" +
                        "\"amount\": \"75.01\"," +
                        "\"balance\": \"58.05\"," +
                        "\"currency\": \"EUR\"," +
                        "\"rate\": \"1.29220\"" +
                    "}" +
                "}" +
            "}" +
        "}"
        let user: User = Fixtures.loadUser()
        user.adapter = MockRestAdapter(body: json)

        user.getTotalBalances().then { (balances: UserBalance) -> () in
            guard let currencies = balances.currencies else {
                XCTFail("Currencies should not be nil.")

                return
            }

            XCTAssertEqual(currencies.count, 2, "Failed: Wrong number of currencies.")
            XCTAssertEqual(currencies["CNY"]!.amount, "6.98", "Failed: Wrong currency amount.")
            XCTAssertEqual(currencies["CNY"]!.balance, "42.82", "Failed: Wrong currency balance.")
            XCTAssertEqual(currencies["CNY"]!.currency, "USD", "Failed: Wrong currency currency.")
            XCTAssertEqual(currencies["CNY"]!.rate, "6.13880", "Failed: Wrong currency rate.")
            XCTAssertEqual(currencies["EUR"]!.amount, "75.01", "Failed: Wrong currency amount.")
            XCTAssertEqual(currencies["EUR"]!.balance, "58.05", "Failed: Wrong currency balance.")
            XCTAssertEqual(currencies["EUR"]!.currency, "EUR", "Failed: Wrong currency currency.")
            XCTAssertEqual(currencies["EUR"]!.rate, "1.29220", "Failed: Wrong currency rate.")
            XCTAssertEqual(balances.total, "1083.77", "Failed: Wrong balance total.")

            expectation.fulfill()
        }

        wait()
    }

    func testGetTotalBalancesShouldReturnEmptyBalancesError() {
        let expectation = expectationWithDescription("User test: get total balances.")
        let user: User = Fixtures.loadUser()
        user.adapter = MockRestAdapter(body: "{}")
        let promise: Promise<UserBalance> = user.getTotalBalances()

        promise.error { (error: ErrorType) -> Void in
            guard let error = error as? UnexpectedResponseError else {
                XCTFail("Error should be UnexpectedResponseError.")

                return
            }

            XCTAssertNil(error.code, "Failed: HTTP status code should be nil.")
            XCTAssertEqual(error.description, "Balances should not be nil.", "Failed: Wrong message.")

            expectation.fulfill()
        }

        wait()
    }

    func testGetTransactionsShouldReturnTheArrayOfTransactions() {
        let expectation = expectationWithDescription("User test: get transactions.")
        let user: User = Fixtures.loadUser()
        user.adapter = MockRestAdapter(body: Mapper().toJSONString([Fixtures.loadTransaction(["transactionId": "foobar"]), Fixtures.loadTransaction(["transactionId": "foobiz"])])!)

        user.getUserTransactions().elements.then({ (transactions: [Transaction]) -> () in
            let mockRestAdapter: MockRestAdapter = (user.adapter as? MockRestAdapter)!

            XCTAssertEqual(mockRestAdapter.headers!.count, 1, "Failed: Wrong number of headers.")
            XCTAssertEqual(mockRestAdapter.headers!["Range"], "items=0-49", "Failed: Wrong number of headers.")
            XCTAssertEqual(transactions.count, 2, "Failed: Wrong number of transaction objects.")
            XCTAssertEqual(transactions[0].id, "foobar", "Failed: Wrong transaction object.")
            XCTAssertEqual(transactions[1].id, "foobiz", "Failed: Wrong transaction object.")

            expectation.fulfill()
        })

        wait()
    }

    func testGetTransactionsShouldReturnThePaginatorCount() {
        let expectation = expectationWithDescription("User test: get transactions.")
        let user: User = Fixtures.loadUser()
        user.adapter = MockRestAdapter(body: Mapper().toJSONString([Fixtures.loadTransaction(["transactionId": "foobar"]), Fixtures.loadTransaction(["transactionId": "foobiz"])])!, headers: ["content-range": "0-2/60"])

        user.getUserTransactions().count().then({ (count: Int) -> () in
            XCTAssertEqual(count, 60, "Failed: Wrong paginator count.")

            expectation.fulfill()
        })

        wait()
    }

    func testGetTransactionsShouldReturnThePaginatorHasNext() {
        let expectation = expectationWithDescription("User test: get transactions.")
        let user: User = Fixtures.loadUser()
        user.adapter = MockRestAdapter(body: Mapper().toJSONString([Fixtures.loadTransaction(["transactionId": "foobar"]), Fixtures.loadTransaction(["transactionId": "foobiz"])])!, headers: ["content-range": "0-49/51"])

        user.getUserTransactions().hasNext().then({ (bool: Bool) -> () in
            XCTAssertTrue(bool, "Failed: Wrong paginator hasNext value.")

            expectation.fulfill()
        })

        wait()
    }

    func testGetTransactionsShouldReturnThePaginatorNextPage() {
        let user: User = Fixtures.loadUser()
        user.adapter = MockRestAdapter(body: Mapper().toJSONString([Fixtures.loadTransaction(["transactionId": "foobar"]), Fixtures.loadTransaction(["transactionId": "foobiz"])])!)
        let paginator: Paginator<Transaction> = user.getUserTransactions()

        paginator.getNext()

        let firstRequestHeaders = (user.adapter as? MockRestAdapter)!.headers

        paginator.getNext()

        let secondRequestHeaders = (user.adapter as? MockRestAdapter)!.headers

        XCTAssertEqual(firstRequestHeaders!.count, 1, "Failed: Wrong number of headers.")
        XCTAssertEqual(secondRequestHeaders!.count, 1, "Failed: Wrong number of headers.")
        XCTAssertEqual(firstRequestHeaders!["Range"], "items=50-99", "Failed: Wrong number of headers.")
        XCTAssertEqual(secondRequestHeaders!["Range"], "items=100-149", "Failed: Wrong number of headers.")
    }

    func testUpdateShouldReturnTheUser() {
        let expectation = expectationWithDescription("User test: update user.")
        let user: User = Fixtures.loadUser(["username": "foobar"])
        user.adapter = MockRestAdapter(body: Mapper().toJSONString(user)!)

        user.update(["username": "foobar"]).then { (user: User) -> () in
            XCTAssertEqual(user.username, "foobar", "Failed: Wrong username.")

            expectation.fulfill()
        }

        wait()
    }

    func testUserMapperShouldReturnAUser() {
        let json: String = "{" +
            "\"username\": \"foobar\"," +
            "\"email\": \"foo@bar.org\"," +
            "\"firstName\": \"foo\"," +
            "\"lastName\": \"bar\"," +
            "\"name\": \"Foo Bar\"," +
            "\"country\": \"BAR\"," +
            "\"state\": \"FOO\"," +
            "\"currencies\": [" +
                "\"BTC\"," +
            "]," +
            "\"status\": \"ok\"," +
            "\"settings\": {" +
                "\"theme\": \"minimalistic\"," +
                "\"currency\": \"USD\"," +
                "\"hasNewsSubscription\": true," +
                "\"intl\": {" +
                    "\"language\": {" +
                        "\"locale\": \"en-US\"" +
                    "}," +
                    "\"dateTimeFormat\": {" +
                        "\"locale\": \"en-US\"" +
                    "}," +
                    "\"numberFormat\": {" +
                        "\"locale\": \"en-US\"" +
                    "}" +
                "}," +
                "\"otp\": {" +
                    "\"login\": {" +
                        "\"enabled\": false" +
                    "}," +
                    "\"transactions\": {" +
                        "\"send\": {" +
                            "\"enabled\": false" +
                        "}," +
                        "\"transfer\": {" +
                            "\"enabled\": true" +
                        "}," +
                        "\"withdraw\": {" +
                            "\"crypto\": {" +
                                "\"enabled\": true" +
                            "}" +
                        "}" +
                    "}" +
                "}" +
            "}" +
        "}"
        let user = Mapper<User>().map(json)

        XCTAssertEqual(user!.country!, "BAR", "Failed: User country didn't match.")
        XCTAssertEqual(user!.currencies!.count, 1, "Failed: User currencies didn't match.")
        XCTAssertEqual(user!.currencies![0], "BTC", "Failed: User currencies didn't match.")
        XCTAssertEqual(user!.email!, "foo@bar.org", "Failed: User email didn't match.")
        XCTAssertEqual(user!.firstName!, "foo", "Failed: User first name didn't match.")
        XCTAssertEqual(user!.lastName!, "bar", "Failed: User last name didn't match.")
        XCTAssertEqual(user!.name!, "Foo Bar", "Failed: User name didn't match.")
        XCTAssertEqual(user!.settings!.currency!, "USD", "Failed: User settings currency didn't match.")
        XCTAssertTrue(user!.settings!.hasNewsSubscription!, "Failed: User settings hasNewsSubscription didn't match.")
        XCTAssertEqual(user!.settings!.intl!.dateTimeFormat!.locale!, "en-US", "Failed: User settings intl dateTimeFormat didn't match.")
        XCTAssertEqual(user!.settings!.intl!.language!.locale!, "en-US", "Failed: User settings intl language didn't match.")
        XCTAssertEqual(user!.settings!.intl!.numberFormat!.locale!, "en-US", "Failed: User settings intl numberFormat didn't match.")
        XCTAssertFalse(user!.settings!.otp!.login!.enabled!, "Failed: User settings otp login didn't match.")
        XCTAssertFalse(user!.settings!.otp!.transactions!.send!.enabled!, "Failed: User settings otp transactions send didn't match.")
        XCTAssertTrue(user!.settings!.otp!.transactions!.transfer!.enabled!, "Failed: User settings otp transactions transfer didn't match.")
        XCTAssertTrue(user!.settings!.otp!.transactions!.withdraw!.crypto!.enabled!, "Failed: User settings otp login didn't match.")
        XCTAssertEqual(user!.settings!.theme!, "minimalistic", "Failed: User settings theme didn't match.")
        XCTAssertEqual(user!.state!, "FOO", "Failed: User name didn't match.")
        XCTAssertEqual(user!.status!, "ok", "Failed: User name didn't match.")
        XCTAssertEqual(user!.username!, "foobar", "Failed: User name didn't match.")
    }

}
