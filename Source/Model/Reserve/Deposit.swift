import Foundation
import ObjectMapper

/// Deposit model.
public class Deposit: Mappable {

    /// The date when the transaction was created.
    public private(set) var createdAt: String?

    /// The deposit in movement.
    public private(set) var input: DepositMovement?

    /// The deposit out movement.
    public private(set) var output: DepositMovement?

    /// The id of the transaction.
    public private(set) var transactionId: String?

    /// The type of the deposit.
    public private(set) var type: String?

    /**
      Constructor.

      - parameter createdAt: The date when the transaction was created.
      - parameter input: The deposit in movement.
      - parameter output: The deposit out movement.
      - parameter transactionId: The id of the transaction.
      - parameter type: The type of the deposit.
    */
    public init(createdAt: String, input: DepositMovement, output: DepositMovement, transactionId: String, type: String) {
        self.createdAt = createdAt
        self.input = input
        self.output = output
        self.transactionId = transactionId
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
        self.createdAt <- map["createdAt"]
        self.input <- map["in"]
        self.output <- map["out"]
        self.transactionId <- map["TransactionId"]
        self.type <- map["type"]
    }

}
