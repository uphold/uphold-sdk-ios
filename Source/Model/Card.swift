import Foundation
import ObjectMapper
import PromiseKit

/// Card model.
public class Card: BaseModel, Mappable {

    /// The id of the card.
    public private(set) var id: String?

    /// The card's primary address dictionary.
    public private(set) var address: [String : String]?

    /// The balance available for withdrawal/usage.
    public private(set) var available: String?

    /// The total balance of the card, including all pending transactions.
    public private(set) var balance: String?

    /// The currency of the card.
    public private(set) var currency: String?

    /// The display name of the card as chosen by the user.
    public private(set) var label: String?

    /// A timestamp of the last time a transaction on this card was conducted.
    public private(set) var lastTransactionAt: String?

    /// The list with the normalized fields.
    public private(set) var normalized: [NormalizedCard]?

    /// The card settings.
    public private(set) var settings: CardSettings?

    /**
      Constructor.

      - parameter id: The id of the card.
      - parameter address: The card's primary address dictionary.
      - parameter available: The balance available for withdrawal/usage.
      - parameter balance: The total balance of the card, including all pending transactions.
      - parameter currency: The currency of the card.
      - parameter label: The display name of the card as chosen by the user.
      - parameter lastTransactionAt: A timestamp of the last time a transaction on this card was conducted.
      - parameter normalized: The list with the normalized fields.
      - parameter settings: The Settings of the card.
    */
    public init(id: String, address: [String : String], available: String, balance: String, currency: String, label: String, lastTransactionAt: String?, normalized: [NormalizedCard], settings: CardSettings) {
        self.id = id
        self.address = address
        self.available = available
        self.balance = balance
        self.currency = currency
        self.label = label
        self.lastTransactionAt = lastTransactionAt
        self.normalized = normalized
        self.settings = settings
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
        self.id <- map["id"]
        self.address <- map["address"]
        self.available <- map["available"]
        self.balance <- map["balance"]
        self.currency <- map["currency"]
        self.label <- map["label"]
        self.lastTransactionAt <- map["lastTransactionAt"]
        self.normalized <- map["normalized"]
        self.settings <- map["settings"]
    }

    /**
      Creates a transaction.

      - parameter transactionRequest: The transaction request information.

      - returns: A promise with the transaction.
    */
    public func createTransaction(transactionRequest: TransactionRequest) -> Promise<Transaction> {
        return createTransaction(false, transactionRequest: transactionRequest)
    }

    /**
      Creates a transaction.

      - parameter commit: A boolean to indicate if it is to commit the transaction on the creation process.
      - parameter transactionRequest: The transaction request information.

      - returns: A promise with the transaction.
    */
    public func createTransaction(commit: Bool, transactionRequest: TransactionRequest) -> Promise<Transaction> {
        guard let id = self.id else {
            return Promise<Transaction>(error: UnexpectedResponseError(message: "Card id should not be nil."))
        }

        let request = self.adapter.buildRequest(UserCardService.createTransaction(id, commit: commit, transactionRequest: Mapper().toJSONString(transactionRequest, prettyPrint: false)!))

        return self.adapter.buildResponse(request)
    }

    /**
      Gets the transactions for the current card.

      - returns: A promise with the list of transactions for the current card.
    */
    public func getTransactions() -> Promise<[Transaction]> {
        guard let id = self.id else {
            return Promise<[Transaction]>(error: UnexpectedResponseError(message: "Card id should not be nil."))
        }

        let request = self.adapter.buildRequest(UserCardService.getUserCardTransactions(id, range: Header.buildRangeHeader(0, end: 5)))

        return self.adapter.buildResponse(request)
    }

    /**
      Update the card information.

      - parameter updateFields: The card fields to update.

      - returns: A promise with the card updated.
    */
    public func update(updateFields: [String: AnyObject]) -> Promise<Card> {
        guard let json = JSONUtils.toJSONString(updateFields) else {
            return Promise<Card>(error: LogicError(code: nil, message: "Error parsing the fields to update."))
        }

        guard let id = self.id else {
            return Promise<Card>(error: UnexpectedResponseError(message: "Card id should not be nil."))
        }

        let request = self.adapter.buildRequest(UserCardService.updateCard(id, updateFields: json))

        return self.adapter.buildResponse(request)
    }

}
