import Foundation
import PromiseKit
import ObjectMapper

/// Transaction model.
public class Transaction: BaseModel, Mappable {

    /// The id of the transaction.
    public private(set) var id: String?

    /// The date and time the transaction was initiated.
    public private(set) var createdAt: String?

    /// The funds to be transferred.
    public private(set) var denomination: Denomination?

    /// The recipient of the funds.
    public private(set) var destination: Destination?

    /// The transaction fees.
    public private(set) var fees: [Fee]?

    /// A message or note provided by the user at the time the transaction was initiated, with the intent of communicating additional information and context about the nature/purpose of the transaction.
    public private(set) var message: String?

    /// The transaction details normalized.
    public private(set) var normalized: [NormalizedTransaction]?

    /// The sender of the funds.
    public private(set) var origin: Origin?

    /// Other parameters of this transaction.
    public private(set) var params: Parameters?

    /// When a transaction is cancelled this contains the transaction ID of the transaction which refunds the amount back to the user.
    public private(set) var refundedById: String?

    /// The current status of the transaction.
    public private(set) var status: String?

    /// The nature of the transaction.
    public private(set) var type: String?

    /**
      Constructor.

      - parameter id: The id of the transaction.
      - parameter createdAt: The date and time the transaction was initiated.
      - parameter denomination: The funds to be transferred.
      - parameter destination: The recipient of the funds.
      - parameter fees: The transaction fees.
      - parameter message: A message or note provided by the user at the time the transaction was initiated, with the intent of communicating additional information and context about the nature/purpose of the transaction.
      - parameter normalized: The transaction details normalized.
      - parameter origin: The sender of the funds.
      - parameter params: Other parameters of this transaction.
      - parameter refundedById: When a transaction is cancelled this contains the transaction ID of the transaction which refunds the amount back to the user.
      - parameter status: The current status of the transaction.
      - parameter type: The nature of the transaction.
    */
    public init(id: String, createdAt: String, denomination: Denomination, destination: Destination, fees: [Fee], message: String, normalized: [NormalizedTransaction], origin: Origin, params: Parameters, refundedById: String, status: String, type: String) {
        self.id = id
        self.createdAt = createdAt
        self.denomination = denomination
        self.destination = destination
        self.fees = fees
        self.message = message
        self.normalized = normalized
        self.origin = origin
        self.params = params
        self.refundedById = refundedById
        self.status = status
        self.type = type
    }

    // MARK: Required by the ObjectMapper.

    /**
      Constructor.

      - parameter map: Mapping data object.
    */
    required public init?(_ map: Map) {
    }

    /**
      Maps the JSON to the Object.

      - parameter map: The object to map.
    */
    public func mapping(map: Map) {
        id  <- map["id"]
        createdAt <- map["createdAt"]
        denomination <- map["denomination"]
        destination <- map["destination"]
        fees <- map["fees"]
        message <- map["message"]
        normalized <- map["normalized"]
        origin <- map["origin"]
        params <- map["params"]
        refundedById <- map["RefundedById"]
        status <- map["status"]
        type <- map["type"]
    }

    /**
      Cancel a transaction.

      - returns: A promise with the transaction.
    */
    public func cancel() -> Promise<Transaction> {
        guard let id = self.id else {
            return Promise<Transaction>(error: UnexpectedResponseError(message: "Transaction id should not be nil."))
        }

        guard let cardId = self.origin?.cardId else {
            return Promise<Transaction>(error: UnexpectedResponseError(message: "Origin cardId is missing from this transaction."))
        }

        guard let status = self.status else {
            return Promise<Transaction>(error: UnexpectedResponseError(message: "Transaction status should not be nil."))
        }

        switch (status) {
            case "pending":
                return Promise<Transaction>(error: LogicError(code: nil, message: "Unable to cancel uncommited transaction."))

            case "waiting":
                let request = self.adapter.buildRequest(UserCardService.cancelTransaction(cardId, transactionId: id))

                return self.adapter.buildResponse(request)

            default:
                return Promise<Transaction>(error: LogicError(code: nil, message: String(format: "This transaction cannot be cancelled, because the current status is %@.", status)))
        }
    }

    /**
      Confirm a transaction.

      - parameter transactionCommit: A transactionCommitRequest with an optional transaction message.

      - returns: A promise with the transaction.
    */
    public func commit(transactionCommit: TransactionCommitRequest) -> Promise<Transaction> {
        guard let id = self.id else {
            return Promise<Transaction>(error: UnexpectedResponseError(message: "Transaction id should not be nil."))
        }

        guard let cardId = self.origin?.cardId else {
            return Promise<Transaction>(error: UnexpectedResponseError(message: "Origin cardId is missing from this transaction."))
        }

        guard let status = self.status else {
            return Promise<Transaction>(error: UnexpectedResponseError(message: "Transaction status should not be nil."))
        }

        if (status != "pending") {
            return Promise<Transaction>(error: LogicError(code: nil, message: String(format: "This transaction cannot be committed, because the current status is %@.", status)))
        }

        let request = self.adapter.buildRequest(UserCardService.confirmTransaction(cardId, transactionId: id, transactionCommitRequest: Mapper().toJSONString(transactionCommit, prettyPrint: false)!))

        return self.adapter.buildResponse(request)
    }

}
