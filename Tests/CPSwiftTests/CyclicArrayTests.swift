import XCTest
@testable import CPSwift

final class SyclicArrayTests: XCTestCase {
    func testLongCyclicArrayNormal() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
        let carr = CyclicArray(arr)
        XCTAssertEqual(carr[3], 4)
    }

    func testLongCyclicArrayOverIndex() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
        let carr = CyclicArray(arr)
        XCTAssertEqual(carr[998244353], 9)
    }

    func testLongCyclicArrayMinusIndex1() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
        let carr = CyclicArray(arr)
        XCTAssertEqual(carr[-2], 14)
    }

    func testLongCyclicArrayMinusIndex2() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
        let carr = CyclicArray(arr)
        XCTAssertEqual(carr[-266144], 2)
    }

    func testLoopedArraySlice() {
        let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
        let carr = CyclicArray(arr)
        let act = Array(carr.arraySlice(fromIndex: 6))
        let exp = [7, 8, 9, 10, 11, 12, 13, 14, 15, 1, 2, 3, 4, 5, 6]
        XCTAssertEqual(act, exp)
    }

    func testShortLoopedArraySlice1() {
        let arr = [1, 2, 3]
        let carr = CyclicArray(arr)
        let act = Array(carr.arraySlice(fromIndex: 2, count: 10))
        let exp = [3, 1, 2, 3, 1, 2, 3, 1, 2, 3]
        XCTAssertEqual(act, exp)
    }

    func testShortLoopedArraySlice2() {
        let arr = [1, 2, 3]
        let carr = CyclicArray(arr)
        let act = Array(carr.arraySlice(fromIndex: 998244353, count: 10))
        let exp = [3, 1, 2, 3, 1, 2, 3, 1, 2, 3]
        XCTAssertEqual(act, exp)
    }
}
