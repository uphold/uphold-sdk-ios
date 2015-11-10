import Foundation
import PromiseKit

/// Reserve model.
public class Reserve: BaseModel {

    /**
      Gets the ledger.

      - parameter start: The start position for the range.
      - parameter end: The end position for the range.

      - returns: A promise with the array of deposits.
    */
    public func getLedger(start: Int, end: Int) -> Promise<[Deposit]> {
        let request = self.adapter.buildRequest(ReserveService.getLedger(Header.buildRangeHeader(start, end: end)))

        return self.adapter.buildResponse(request)
    }

    /**
      Gets the reserve summary of all the obligations and assets within it.

      - returns: A promise with the reserve summary of all the obligations and assets within it.
    */
    public func getStatistics() -> Promise<[ReserveStatistics]> {
        let request = self.adapter.buildRequest(ReserveService.getStatistics())

        return self.adapter.buildResponse(request)
    }

    /**
      Gets the information of any transaction.

      - parameter transactionId: The id of the transaction.

      - returns: A promise with the transaction.
    */
    public func getTransactionById(transactionId: String) -> Promise<Transaction> {
        let request = self.adapter.buildRequest(ReserveService.getReserveTransactionById(transactionId))

        return self.adapter.buildResponse(request)
    }

    /**
      Gets information of all the transactions from the beginning of time.

      - parameter start: The start position for the range.
      - parameter end: The end position for the range.

      - returns: A promise with the array of transactions.
    */
    public func getTransactions(start: Int, end: Int) -> Promise<[Transaction]> {
        let request = self.adapter.buildRequest(ReserveService.getReserveTransactions(Header.buildRangeHeader(start, end: end)))

        return self.adapter.buildResponse(request)
    }

}
