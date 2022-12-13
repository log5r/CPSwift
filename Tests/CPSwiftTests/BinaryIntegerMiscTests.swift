import XCTest
@testable import CPSwift

final class BinaryIntegerMiscTests: XCTestCase {
    func testBinaryDescription() {
        XCTAssertEqual(12.binaryDescription(bitWidth: 8), "00001100")
        XCTAssertEqual(12.binaryDescription(), "0000000000000000000000000000000000000000000000000000000000001100")
    }
}