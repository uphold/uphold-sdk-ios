import Foundation
import ObjectMapper
import PromiseKit

/// Paginator Protocol.
protocol PaginatorProtocol {

    /// Paginator generic type.
    associatedtype T

    /**
      A closure to get a promise with the total number of elements.

      - returns: A promise with the number of elements.
    */
    var countClosure: () -> Promise<Int> {get}

    /**
      A closure to get a promise with the next page of elements.

      - returns: A promise with the array of elements.
    */
    var nextPageClosure: (range: String) -> Promise<[T]> {get}

    /**
      A closure to get a promise with a bolean indicating if exists a next page of elements.

      - returns: A promise with the bolean indicator.
    */
    var hasNextPageClosure: (currentPage: Int) -> Promise<Bool> {get}

}
