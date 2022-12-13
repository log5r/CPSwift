import XCTest
@testable import CPSwift

final class StringMiscTests: XCTestCase {
    func testValues() {
        let str = "1234asdf"
        XCTAssertEqual(str.values(), ["1", "2", "3", "4", "a", "s", "d", "f"])
        XCTAssertEqual(str.asciiIntValues()!, [49, 50, 51, 52, 97, 115, 100, 102])
    }
    func testAsciiIntValues() {
        let str = "1234asdf"
        let asciiIntValues = str.asciiIntValues()
        XCTAssertNotNil(asciiIntValues)
        XCTAssertEqual(asciiIntValues!, [49, 50, 51, 52, 97, 115, 100, 102])

    }
}