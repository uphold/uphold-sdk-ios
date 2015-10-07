import Foundation
import SwiftClient

/// Ticker service.
public class TickerService {

    /**
      Creates a request to get the tickers on the system.

      - returns: A request to get the tickers on the system.
    */
    static func getAllTickers() -> Request {
        return BitreserveClient().get("/v0/ticker")
    }

    /**
      Creates a request to get the tickers on the system for the selected currency.

      - parameter currency: The currency to get the results.

      - returns: A request to get the tickers on the system for the selected currency.
    */
    static func getAllTickersByCurrency(currency: String) -> Request {
        return BitreserveClient().get(String(format: "/v0/ticker/%@", currency))
    }

}
