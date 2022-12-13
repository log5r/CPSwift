import XCTest
@testable import AtCoderSupport

final class BigIntTests: XCTestCase {
    func test() {
        do {
            var (a, b) = (3.99, 4.01)
            a.superiorMerge(using: b)
            XCTAssertEqual(a, 4.01)
        }
        do {
            var (a, b) = (3.99, 4.01)
            a.inferiorMerge(using: b)
            XCTAssertEqual(a, 3.99)
        }
    }
}
