import Foundation
import ObjectMapper
import PromiseKit

/// Paginator model.
public class Paginator<T>: PaginatorProtocol {

    /// Default offset page.
    static var DEFAULT_OFFSET: Int {
        return 50
    }

    /// Default start page.
    static var DEFAULT_START: Int {
        return 0
    }

    /// The current page.
    private var currentPage: Int

    /// A promise with the first list of elements.
    public let elements: Promise<[T]>

    /// Closure to get a promise with the total number of elements.
    let countClosure: () -> Promise<Int>

    /// Closure to get a promise with a bolean indicating if exists a next page of elements.
    let hasNextPageClosure: (currentPage: Int) -> Promise<Bool>

    /// Closure to get a promise with the next page of elements.
    let nextPageClosure: (range: String) -> Promise<[T]>

    /**
      Constructor

      - parameter countClosure: A closure to get the total number of elements.
      - parameter elements: A promise with the first page of elements.
      - parameter hasNextPageClosure: A closure to check if there are more pages.
      - parameter nextPageClosure: A closure to get the next page of elements.
    */
    init(countClosure: () -> Promise<Int>, elements: Promise<[T]>, hasNextPageClosure: (currentPage: Int) -> Promise<Bool>, nextPageClosure: (range: String) -> Promise<[T]>) {
        self.countClosure = countClosure
        self.currentPage = 1
        self.elements = elements
        self.hasNextPageClosure = hasNextPageClosure
        self.nextPageClosure = nextPageClosure
    }

    /**
      Gets the total number of elements.

      - returns: A promise with the total number of elements.
    */
    public func count() -> Promise<Int> {
        return countClosure()
    }

    /**
      Gets the next page of elements.

      - returns: A promise with the array of elements.
    */
    public func getNext() -> Promise<[T]> {
        defer {
            currentPage++

            objc_sync_exit(self.currentPage)
        }

        objc_sync_enter(self.currentPage)

        let promise: Promise<[T]> = self.nextPageClosure(range: Header.buildRangeHeader((Paginator.DEFAULT_OFFSET * currentPage), end: ((Paginator.DEFAULT_OFFSET * currentPage) + Paginator.DEFAULT_OFFSET) - 1))

        return promise
    }

    /**
      Gets a promise with a bolean indicating if exists a next page of elements.

      - returns: A promise with the bolean indicator.
    */
    public func hasNext() -> Promise<Bool> {
        return self.hasNextPageClosure(currentPage: self.currentPage)
    }

}
