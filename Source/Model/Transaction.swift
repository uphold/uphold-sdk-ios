import Foundation
import ObjectMapper

/// Transaction model.
public class Transaction: Mappable {

    /// The id of the transaction.
    public private(set) var id: String?

    /// The date and time the transaction was initiated.
    public private(set) var createdAt: String?

    /// The funds to be transferred.
    public private(set) var denomination: Denomination?

    /// The recipient of the funds.
    public private(set) var destination: Destination?

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
      - parameter message: A message or note provided by the user at the time the transaction was initiated, with the intent of communicating additional information and context about the nature/purpose of the transaction.
      - parameter normalized: The transaction details normalized.
      - parameter origin: The sender of the funds.
      - parameter params: Other parameters of this transaction.
      - parameter refundedById: When a transaction is cancelled this contains the transaction ID of the transaction which refunds the amount back to the user.
      - parameter status: The current status of the transaction.
      - parameter type: The nature of the transaction.
    */
    public init(id: String, createdAt: String, denomination: Denomination, destination: Destination, message: String, normalized: [NormalizedTransaction], origin: Origin, params: Parameters, refundedById: String, status: String, type: String) {
        self.id = id
        self.createdAt = createdAt
        self.denomination = denomination
        self.destination = destination
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
        message <- map["message"]
        normalized <- map["normalized"]
        origin <- map["origin"]
        params <- map["params"]
        refundedById <- map["RefundedById"]
        status <- map["status"]
        type <- map["type"]
    }

}
