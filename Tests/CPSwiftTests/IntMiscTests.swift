import XCTest
@testable import CPSwift

final class IntMiscTests: XCTestCase {
    func testSqrt() {
        XCTAssertEqual(25.sqrt(), 5)
        XCTAssertEqual(5.sqrt(), 2)
        XCTAssertEqual(8.sqrt(), 2)
    }
    func testDivisors() {
        XCTAssertEqual(12.divisors(), [1, 2, 3, 4, 6, 12])
        XCTAssertEqual(36.divisors(), [1, 2, 3, 4, 6, 9, 12, 18, 36])
    }
}