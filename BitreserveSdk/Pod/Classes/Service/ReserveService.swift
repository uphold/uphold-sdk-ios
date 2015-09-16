import Foundation
import SwiftClient

/// Reserve service.
public class ReserveService {

    /**
        Creates a request to get the reserve ledger.

        :param: range The range of the request.

        :returns: A request to get the reserve ledger.
    */
    static func getLedger(range: String) -> Request {
        return BitreserveClient().get("/v0/reserve/ledger").set("Range", range)
    }


    /**
        Creates a request to get a reserve transaction.

        :param: transactionId The id of the transaction.

        :returns: A request to get a reserve transaction.
    */
    static func getReserveTransactionById(transactionId: String) -> Request {
        return BitreserveClient().get(String(format: "/v0/reserve/transactions/%s", transactionId))
    }

    /**
        Creates a request to get the reserve transactions.

        :param: range The range of the request.

        :returns: A request to get the reserve transactions.
    */
    static func getReserveTransactions(range: String) -> Request {
        return BitreserveClient().get("/v0/reserve/transactions").set("Range", range)
    }


    /**
        Creates a request to get the reserve statistics.

        :returns: A request to get the reserve statistics.
    */
    static func getStatistics(range: String) -> Request {
        return BitreserveClient().get("/v0/reserve/statistics")
    }

}
