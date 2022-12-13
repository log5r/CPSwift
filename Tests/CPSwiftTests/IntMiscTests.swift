import XCTest
@testable import CPSwift

final class IntMiscTests: XCTestCase {
    func testSqrt() {
        XCTAssertEqual(25.sqrt(), 5)
        XCTAssertEqual(5.sqrt(), 2)
        XCTAssertEqual(8.sqrt(), 2)
    }
    func testPow() {
        XCTAssertEqual(2.pow(16), 65536)
        XCTAssertEqual(2.pow(16, mod: 256), 0)
        XCTAssertEqual(2.pow(16, mod: 998244353), 65536)
        XCTAssertEqual(2.pow(65535, mod: 998244353), 840998715)
        XCTAssertEqual(7.pow(2, mod: 13), 10)
        XCTAssertEqual(16777216.pow(16777216, mod: 998244353), 866414704)
    }
    func testDivisors() {
        XCTAssertEqual(12.divisors(), [1, 2, 3, 4, 6, 12])
        XCTAssertEqual(36.divisors(), [1, 2, 3, 4, 6, 9, 12, 18, 36])
    }
}