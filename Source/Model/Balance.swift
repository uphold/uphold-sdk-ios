import Foundation
import ObjectMapper

/// Balance model.
public class Balance: Mappable {

    /// The user balance.
    public private(set) var balances: UserBalance?

    /**
      Constructor.

      - parameter balances: The user balance.
    */
    public init(balances: UserBalance) {
        self.balances = balances
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
        self.balances <- map["balances"]
    }

}
