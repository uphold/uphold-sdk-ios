import Foundation

/// Transaction model.
public class Transaction {
    
    /// A unique id the transaction.
    public private(set) var id: String
    
    /// The date and time the transaction was initiated.
    public private(set) var createdAt: String
    
    /// The funds to be transfered.
    public private(set) var denomination: Denomination
    
    /// The recipient of the funds.
    public private(set) var destination: Destination
    
    /// A message or note provided by the user at the time the transaction was initiated, with the intent of communicating additional information and context about the nature/purpose of the transaction.
    public private(set) var message: String
    
    /// The sender of the funds.
    public private(set) var origin: Origin
    
    /// Other parameters of this transaction.
    public private(set) var params: Parameters
    
    /// When a transaction is cancelled, specifically a transaction in which money is sent to an email address, this contains the transaction ID of the transaction which refunds the amount back to the user.
    public private(set) var refundedById: String
    
    /// The current status of the transaction.
    public private(set) var status: String
    
    /// The nature of the transaction.
    public private(set) var type: String
    
    /**
        Constructor.
    
        :param: id A unique id the transaction.
        :param: createdAt The date and time the transaction was initiated.
        :param: denomination The funds to be transfered.
        :param: destination The recipient of the funds.
        :param: message A message or note provided by the user at the time the transaction was initiated, with the intent of communicating additional information and context about the nature/purpose of the transaction.
        :param: origin The sender of the funds.
        :param: params Other parameters of this transaction.
        :param: refundedById When a transaction is cancelled, specifically a transaction in which money is sent to an email address, this contains the transaction ID of the transaction which refunds the amount back to the user.
        :param: status The current status of the transaction.
        :param: type The nature of the transaction.
    */
    public init(id: String, createdAt: String, denomination: Denomination, destination: Destination, message: String, origin: Origin, params: Parameters, refundedById: String, status: String, type: String) {
        self.id = id
        self.createdAt = createdAt
        self.denomination = denomination
        self.destination = destination
        self.message = message
        self.origin = origin
        self.params = params
        self.refundedById = refundedById
        self.status = status
        self.type = type
    }

}