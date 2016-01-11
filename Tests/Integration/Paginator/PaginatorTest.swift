import XCTest
import PromiseKit
@testable import UpholdSdk

/// Paginator integration tests.
class PaginatorTest: UpholdTestCase {

    let paginator: Paginator<AnyObject> = Paginator(countClosure: { () -> Promise<Int> in
            return Promise { fulfill, reject in
                fulfill(10)
            }
        },
        elements: Promise { fulfill, reject in
            fulfill([AnyObject]())
        },
        hasNextPageClosure: { (currentPage) -> Promise<Bool> in
            return Promise { fulfill, reject in
                fulfill(true)
            }
        },
        nextPageClosure: { (range) -> Promise<[AnyObject]> in
            return Promise { fulfill, reject in
                let arrayObject = ["foo", "bar"]
                fulfill(arrayObject)
            }
        })

    func testCount() {
        let expectation = expectationWithDescription("Paginator test.")

        paginator.count().then { (count: Int) -> () in
            XCTAssertEqual(count, 10, "Failed: Wrong object.")

            expectation.fulfill()
        }

        wait()
    }

    func testGetNext() {
        let expectation = expectationWithDescription("Paginator test.")

        paginator.getNext().then { (objects: [AnyObject]) -> () in
            XCTAssertEqual(objects[0] as? String, "foo", "Failed: Wrong object.")
            XCTAssertEqual(objects[1] as? String, "bar", "Failed: Wrong object.")

            expectation.fulfill()
        }

        wait()
    }

    func testGetNextPage() {
        let expectation = expectationWithDescription("Paginator test.")

        paginator.nextPageClosure(range: "foobar").then { (objects: [AnyObject]) -> () in
            XCTAssertEqual(objects[0] as? String, "foo", "Failed: Wrong object.")
            XCTAssertEqual(objects[1] as? String, "bar", "Failed: Wrong object.")

            expectation.fulfill()
        }

        wait()
    }

    func testHasNextPage() {
        let expectation = expectationWithDescription("Paginator test.")

        paginator.hasNextPageClosure(currentPage: 1).then { (hasNext: Bool) -> () in
            XCTAssertTrue(hasNext, "Failed: Wrong object.")

            expectation.fulfill()
        }

        wait()
    }

}
