import Foundation
import ObjectMapper
import PromiseKit

/// User model.
public class User: BaseModel, Mappable {

    /// The user country.
    public private(set) var country: String?

    /// The user's list of currencies.
    public private(set) var currencies: [String]?

    /// The user email.
    public private(set) var email: String?

    /// The user first name.
    public private(set) var firstName: String?

    /// The user last name.
    public private(set) var lastName: String?

    /// The user name.
    public private(set) var name: String?

    /// The user's settings.
    public private(set) var settings: UserSettings?

    /// The user state.
    public private(set) var state: String?

    /// The user status.
    public private(set) var status: String?

    /// The user username.
    public private(set) var username: String?

    /**
      Constructor.

      - parameter country: The user country.
      - parameter currencies: The user list of currencies.
      - parameter email: The user email.
      - parameter firstName: The user first name.
      - parameter lastName: The user last name.
      - parameter name: The user name.
      - parameter settings: The user settings.
      - parameter state: The user state.
      - parameter status: The user status.
      - parameter username: The user username.
    */
    public init(country: String, currencies: [String], email: String, firstName: String, lastName: String, name: String, settings: UserSettings, state: String, status: String, username: String) {
        self.country = country
        self.currencies = currencies
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.name = name
        self.settings = settings
        self.state = state
        self.status = status
        self.username = username
    }

    // MARK: Required by the ObjectMapper.

    /**
      Constructor.
    */
    required public init?(_ map: Map) {
    }

    /**
      Maps the JSON to the Object.

      - parameter map: The object to map.
     */
    public func mapping(map: Map) {
        self.country <- map["country"]
        self.currencies <- map["currencies"]
        self.email <- map["email"]
        self.firstName <- map["firstName"]
        self.lastName <- map["lastName"]
        self.name <- map["name"]
        self.settings <- map["settings"]
        self.state <- map["state"]
        self.status <- map["status"]
        self.username <- map["username"]
    }

    /**
      Creates a contact for the user.

      - parameter contactRequest: The ContactRequest with the information to create the contact.

      - returns: A promise with the created contact.
     */
    public func createContact(contactRequest: ContactRequest) -> Promise<Contact> {
        let request = self.adapter.buildRequest(UserService.createContact(Mapper().toJSONString(contactRequest, prettyPrint: false)!))

        return self.adapter.buildResponse(request)
    }

    /**
      Gets the user balances.

      - returns: A promise with the user balance.
     */
    public func getBalances() -> Promise<[Currency]> {
        let request = self.adapter.buildRequest(UserService.getUserBalances())
        let balance: Promise<Balance> = self.adapter.buildResponse(request)

        return balance.then { (balance: Balance) -> Promise<[Currency]> in
            return Promise { fulfill, reject in
                var responseCurrencies: [Currency] = []

                guard let balances = balance.balances else {
                    reject(UnexpectedResponseError(message: "Balances should not be nil."))

                    return
                }

                guard let currencies = balances.currencies else {
                    reject(UnexpectedResponseError(message: "Currencies should not be nil."))

                    return
                }

                currencies.sort({$0.0 < $1.0}).forEach({ (currency: (String, Currency)) -> () in
                    responseCurrencies.append(currency.1)
                })

                fulfill(responseCurrencies)
            }
        }
    }

    /**
      Gets the user balance by currency.

      - parameter currency: The currency to filter the balances.

      - returns: A promise with the user balance for the currency.
     */
    public func getBalanceByCurrency(currency: String) -> Promise<Currency> {
        let request = self.adapter.buildRequest(UserService.getUserBalances())
        let balance: Promise<Balance> = self.adapter.buildResponse(request)

        return balance.then { (balance: Balance) -> Promise<Currency> in
            return Promise { fulfill, reject in
                guard let balances = balance.balances else {
                    reject(UnexpectedResponseError(message: "Balances should not be nil."))

                    return
                }

                guard let currencies = balances.currencies else {
                    reject(UnexpectedResponseError(message: "Currencies should not be nil."))

                    return
                }

                guard let currency = currencies[currency] else {
                    reject(LogicError(code: nil, message: "Currency does not exist."))

                    return
                }

                fulfill(currency)
            }
        }
    }

    /**
      Gets user cards.

      - returns: A promise with the cards user list.
     */
    public func getCards() -> Promise<[Card]> {
        let request = self.adapter.buildRequest(UserCardService.getUserCards())

        return self.adapter.buildResponse(request)
    }

    /**
      Gets the user card with the card id.

      - parameter cardId: The id of the card we want.

      - returns: A promise with the card.
     */
    public func getCardById(cardId: String) -> Promise<Card> {
        let request = self.adapter.buildRequest(UserCardService.getUserCardById(cardId))

        return self.adapter.buildResponse(request)
    }

    /**
      Gets current user’s cards on a given currency.

      - parameter currency: The currency to filter the cards.

      - returns: A promise with the list of cards.
     */
    public func getCardsByCurrency(currency: String) -> Promise<[Card]> {
        let request = self.adapter.buildRequest(UserCardService.getUserCards())
        let cards: Promise<[Card]> = self.adapter.buildResponse(request)

        return cards.then { (cards: [Card]) -> Promise<[Card]> in
            return Promise { fulfill, reject in
                let filteredCards = cards.filter() {
                    $0.currency == currency
                }

                if (filteredCards.isEmpty) {
                    reject(LogicError(code: nil, message: "There are no cards in the given currency."))
                }

                fulfill(filteredCards)
            }
        }
    }

    /**
      Gets the user contacts.

      - returns: A promise with the list of user contacts.
     */
    public func getContacts() -> Promise<[Contact]> {
        let request = self.adapter.buildRequest(UserService.getUserContacts())

        return self.adapter.buildResponse(request)
    }

    /**
      Gets the user phones.

      - returns: A promise with the list of user phones.
     */
    public func getPhones() -> Promise<[Phone]> {
        let request = self.adapter.buildRequest(UserService.getUserPhones())

        return self.adapter.buildResponse(request)
    }

    /**
      Gets the user total balance.

      - returns: A promise with the user balance.
     */
    public func getTotalBalances() -> Promise<UserBalance> {
        let request = self.adapter.buildRequest(UserService.getUserBalances())
        let balance: Promise<Balance> = self.adapter.buildResponse(request)

        return balance.then { (balance: Balance) -> Promise<UserBalance> in
            return Promise { fulfill, reject in
                guard let balances = balance.balances else {
                    reject(UnexpectedResponseError(message: "Balances should not be nil."))

                    return
                }

                fulfill(balances)
            }
        }
    }

    /**
      Gets the user transactions.

      - returns: A promise with the user transactions.
     */
    public func getUserTransactions() -> Promise<[Transaction]> {
        let request = self.adapter.buildRequest(UserService.getUserPhones())

        return self.adapter.buildResponse(request)
    }

    /**
      Updates the user.

      - parameter updateFields: The fields to update.

      - returns: A promise with the updated user.
     */
    public func update(updateFields: [String: AnyObject]) -> Promise<User> {
        guard let json = JSONUtils.toJSONString(updateFields) else {
            return Promise<User>(error: LogicError(code: nil, message: "Error parsing the fields to update."))
        }

        let request = self.adapter.buildRequest(UserService.updateUser(json))

        return self.adapter.buildResponse(request)
    }

}
