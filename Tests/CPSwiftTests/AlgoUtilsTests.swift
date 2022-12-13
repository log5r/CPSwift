import XCTest
@testable import CPSwift

final class AlgoUtilsTests: XCTestCase {
    func testRepeat() {
        var i = 0
        LoopUtils.repeat(count: 100) {
            i += 1
        }
        XCTAssertEqual(i, 100)
    }
}
