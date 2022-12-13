import XCTest
@testable import CPSwift

final class ComparableMiscTests: XCTestCase {
    func testInferiorMergeIntValues() {
        for _ in 0..<100 {
            let a = Int.random(in: 50..<100)
            let b = Int.random(in: 0..<a)
            var (p, q) = (a, b)
            XCTAssertFalse(q.inferiorMerge(using: a))
            XCTAssertEqual(q, b)
            XCTAssertTrue(p.inferiorMerge(using: b))
            XCTAssertEqual(p, b)
            XCTAssertEqual(p, q)
        }
    }
    func testSuperiorMergeIntValues() {
        for _ in 0..<100 {
            let a = Int.random(in: 0..<50)
            let b = Int.random(in: (a + 1)..<100)
            var (p, q) = (a, b)
            XCTAssertFalse(q.superiorMerge(using: a))
            XCTAssertEqual(q, b)
            XCTAssertTrue(p.superiorMerge(using: b))
            XCTAssertEqual(p, b)
            XCTAssertEqual(p, q)
        }
    }
    func testInferiorMergeDoubleValues() {
        for _ in 0..<100 {
            let a = Double.random(in: 50.0..<100.0)
            let b = Double.random(in: 0.0..<a)
            var (p, q) = (a, b)
            XCTAssertFalse(q.inferiorMerge(using: a))
            XCTAssertEqual(q, b)
            XCTAssertTrue(p.inferiorMerge(using: b))
            XCTAssertEqual(p, b)
            XCTAssertEqual(p, q)
        }
    }
    func testSuperiorMergeDoubleValues() {
        for _ in 0..<100 {
            let a = Double.random(in: 0.0..<50.0)
            let b = Double.random(in: (a + 1.0)..<100.0)
            var (p, q) = (a, b)
            XCTAssertFalse(q.superiorMerge(using: a))
            XCTAssertEqual(q, b)
            XCTAssertTrue(p.superiorMerge(using: b))
            XCTAssertEqual(p, b)
            XCTAssertEqual(p, q)
        }
    }
}