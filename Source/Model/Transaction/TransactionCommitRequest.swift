import Foundation
import ObjectMapper

/// Transaction commit request model.
open class TransactionCommitRequest: Mappable {

    /// The transaction beneficiary.
    public private(set) final var beneficiary: Beneficiary?

    /// The transaction message.
    public private(set) final var message: String?

    /// The transaction security code.
    public private(set) final var securityCode: String?

    /**
      Constructor.

      - parameter beneficiary: The transaction beneficiary.
    */
    public init(beneficiary: Beneficiary) {
        self.beneficiary = beneficiary
    }

    /**
      Constructor.

      - parameter message: The transaction message.
    */
    public init(message: String) {
        self.message = message
    }

    /**
     Constructor.

     - parameter securityCode: The transaction security code.
     */
    public init(securityCode: String) {
        self.securityCode = securityCode
    }

    /**
      Constructor.

      - parameter beneficiary: The transaction beneficiary.
      - parameter message: The transaction message.
    */
    public init(beneficiary: Beneficiary?, message: String?) {
        self.beneficiary = beneficiary
        self.message = message
    }

    /**
      Constructor.

      - parameter message: The transaction message.
      - parameter securityCode: The transaction security code.
    */
    public init(message: String?, securityCode: String) {
        self.message = message
        self.securityCode = securityCode
    }

    // MARK: Required by the ObjectMapper.

    /**
      Constructor.

      - parameter map: Mapping data object.
    */
    required public init?(map: Map) {
    }

    /**
      Maps the JSON to the Object.

      - parameter map: The object to map.
    */
    open func mapping(map: Map) {
        self.beneficiary <- map["beneficiary"]
        self.message <- map["message"]
    }

}
