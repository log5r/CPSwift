import XCTest
@testable import CPSwift

final class ComparableMiscTests: XCTestCase {
    func testInferiorMergeIntValues() {
        for _ in 0..<100 {
            var a = Int.random(in: 50..<100)
            let b = Int.random(in: 0..<a)
            XCTAssertTrue(a.inferiorMerge(using: b))
            XCTAssertEqual(a, b)
        }
    }
    func testSuperiorMergeIntValues() {
        for _ in 0..<100 {
            var a = Int.random(in: 0..<50)
            let b = Int.random(in: (a + 1)..<100)
            XCTAssertTrue(a.superiorMerge(using: b))
            XCTAssertEqual(a, b)
        }
    }
    func testInferiorMergeDoubleValues() {
        for _ in 0..<100 {
            var a = Double.random(in: 50.0..<100.0)
            let b = Double.random(in: 0.0..<a)
            XCTAssertTrue(a.inferiorMerge(using: b))
            XCTAssertEqual(a, b)
        }
    }
    func testSuperiorMergeDoubleValues() {
        for _ in 0..<100 {
            var a = Double.random(in: 0.0..<50.0)
            let b = Double.random(in: (a + 1.0)..<100.0)
            XCTAssertTrue(a.superiorMerge(using: b))
            XCTAssertEqual(a, b)
        }
    }
}