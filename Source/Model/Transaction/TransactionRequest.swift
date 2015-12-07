import Foundation
import ObjectMapper

/// Transaction request model.
public class TransactionRequest: Mappable {

    /// The denomination of the transaction request.
    public private(set) final var denomination: TransactionDenominationRequest?

    /// The destination of the transaction request.
    public private(set) final var destination: String?

    /**
      Constructor.

      - parameter denomination: The denomination of the transaction request.
      - parameter destination: The destination of the transaction request.
    */
    public init(denomination: TransactionDenominationRequest, destination: String) {
        self.denomination = denomination
        self.destination = destination
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
        self.denomination <- map["denomination"]
        self.destination <- map["destination"]
    }

}
