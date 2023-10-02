import XCTest
@testable import CPSwift

final class StringFMiscTests: XCTestCase {

    func testMatch() {
        let s = "hogefuga"
        let t = "hoge"
        let u = "fuga"
        XCTAssertTrue(s.match("^\(t)"))
        XCTAssertFalse(s.match("^\(u)"))
        XCTAssertTrue(s.match("\(u)$"))
        XCTAssertFalse(s.match("\(t)$"))
    }

    func testExtractFirstMatched() {
        do {
            let str = "All Your base are belong to us"
            let res = ["base"]
            XCTAssertEqual(str.extractFirstMatched("b\\w*"), res)
        }
    }

}
