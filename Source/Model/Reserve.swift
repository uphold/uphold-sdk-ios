import Foundation
import PromiseKit
import SwiftClient

/// Reserve model.
public class Reserve: BaseModel {

    /**
      Gets the ledger.

      - returns: A paginator with the array of deposits.
    */
    public func getLedger() -> Paginator<Deposit> {
        let request = self.adapter.buildRequest(ReserveService.getLedger(Header.buildRangeHeader(Paginator<Deposit>.DEFAULT_START, end: Paginator<Deposit>.DEFAULT_OFFSET - 1)))

        let paginator: Paginator<Deposit> = Paginator(countClosure: { () -> Promise<Int> in
                return Promise { fulfill, reject in
                    self.adapter.buildRequest(ReserveService.getLedger(Header.buildRangeHeader(0, end: 1))).end({ (response: Response) -> Void in
                        guard let count = Header.getTotalNumberOfResults(response.headers) else {
                            reject(UnexpectedResponseError(message: "Content-Type header should not be nil."))

                            return
                        }

                        fulfill(count)
                    })
                }
            },
            elements: self.adapter.buildResponse(request),
            hasNextPageClosure: { (currentPage) -> Promise<Bool> in
                return Promise { fulfill, reject in
                    self.adapter.buildRequest(ReserveService.getLedger(Header.buildRangeHeader(0, end: 1))).end({ (response: Response) -> Void in
                        guard let count = Header.getTotalNumberOfResults(response.headers) else {
                            reject(UnexpectedResponseError(message: "Content-Type header should not be nil."))

                            return
                        }

                        fulfill((currentPage * Paginator<Deposit>.DEFAULT_OFFSET) < count)
                    })
                }
            },
            nextPageClosure: { (range) -> Promise<[Deposit]> in
                let request = self.adapter.buildRequest(ReserveService.getLedger(range))
                let promise: Promise<[Deposit]> = self.adapter.buildResponse(request)

                return promise
            })

        return paginator
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

      - returns: A paginator with the array of transactions.
    */
    public func getTransactions() -> Paginator<Transaction> {
        let request = self.adapter.buildRequest(ReserveService.getReserveTransactions(Header.buildRangeHeader(Paginator<Transaction>.DEFAULT_START, end: Paginator<Transaction>.DEFAULT_OFFSET - 1)))

        let paginator: Paginator<Transaction> = Paginator(countClosure: { () -> Promise<Int> in
                return Promise { fulfill, reject in
                    self.adapter.buildRequest(ReserveService.getReserveTransactions(Header.buildRangeHeader(0, end: 1))).end({ (response: Response) -> Void in
                        guard let count = Header.getTotalNumberOfResults(response.headers) else {
                            reject(UnexpectedResponseError(message: "Content-Type header should not be nil."))

                            return
                        }

                        fulfill(count)
                    })
                }
            },
            elements: self.adapter.buildResponse(request),
            hasNextPageClosure: { (currentPage) -> Promise<Bool> in
                return Promise { fulfill, reject in
                    self.adapter.buildRequest(ReserveService.getReserveTransactions(Header.buildRangeHeader(0, end: 1))).end({ (response: Response) -> Void in
                        guard let count = Header.getTotalNumberOfResults(response.headers) else {
                            reject(UnexpectedResponseError(message: "Content-Type header should not be nil."))

                            return
                        }

                        fulfill((currentPage * Paginator<Transaction>.DEFAULT_OFFSET) < count)
                    })
                }
            },
            nextPageClosure: { (range) -> Promise<[Transaction]> in
                let request = self.adapter.buildRequest(ReserveService.getReserveTransactions(range))
                let promise: Promise<[Transaction]> = self.adapter.buildResponse(request)

                return promise
            })

        return paginator
    }

}
