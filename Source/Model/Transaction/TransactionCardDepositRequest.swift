import Foundation
import ObjectMapper

/// Transaction card deposit request model.
public class TransactionCardDepositRequest: TransactionDepositRequest {

    /// The card's security code.
    public private(set) final var securityCode: String?

    /**
      Constructor.

      - parameter denomination: The denomination of the transaction request.
      - parameter origin: The origin of the transaction request in case of a deposit.
      - parameter securityCode: The card's security code.
    */
    public init(denomination: TransactionDenominationRequest, origin: String, securityCode: String) {
        super.init(denomination: denomination, origin: origin)

        self.securityCode = securityCode
    }

    // MARK: Required by the ObjectMapper.

    /**
      Constructor.

      - parameter map: Mapping data object.
    */
    required public init?(_ map: Map) {
        super.init(map)
    }

    /**
      Maps the JSON to the Object.

      - parameter map: The object to map.
    */
    public override func mapping(map: Map) {
        super.mapping(map)

        self.securityCode <- map["securityCode"]
    }

}
