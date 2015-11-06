import Foundation
import PromiseKit
import SwiftClient

/// Uphold client.
public class UpholdClient: Client {

    /// The Uphold client's token.
    public private(set) var token: Token

    /**
      Constructor.
     */
    public override init() {
        self.token = Token()

        super.init()

        self.baseUrl(GlobalConfigurations.UPHOLD_API_URL)
    }

    /**
      Gets all the exchange rates for all currency pairs.

      - returns: A promise with all exchanges rates for all currency pairs.
     */
    public func getTickers() -> Promise<[Rate]> {
        let adapter = self.token.adapter

        return adapter.buildResponse(adapter.buildRequest(TickerService.getAllTickers()))
    }

    /**
      Gets all the exchange rates to a given currency.

      - parameter currency: The filter currency.

      - returns: A promise with all exchanges rates relative to a given currency.
     */
    public func getTickersByCurrency(currency: String) -> Promise<[Rate]> {
        let adapter = self.token.adapter

        return adapter.buildResponse(adapter.buildRequest(TickerService.getAllTickersByCurrency(currency)))
    }

}
