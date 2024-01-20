import XCTest
@testable import CPSwift

final class IntMiscTests: XCTestCase {

    func testRange() {
        do {
            var arr = [Int]()
            for i in 10.zeroStartRange() {
                arr.append(i)
            }
            XCTAssertEqual(arr, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
        }
        do {
            XCTAssertNoThrow((-1).zeroStartRange())
        }
        do {
            var arr = [Int]()
            for i in 10.oneStartRange() {
                arr.append(i)
            }
            XCTAssertEqual(arr, [1, 2, 3, 4, 5, 6, 7, 8, 9])
        }
        do {
            XCTAssertNoThrow((-1).oneStartRange())
        }
        do {
            var arr = [Int]()
            10.timesLoop { i in
                arr.append(i)
            }
            XCTAssertEqual(arr, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
        }
    }

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