import XCTest
@testable import CPSwift

final class ArrayMiscTests: XCTestCase {
    func testCumulate() {
        do {
            let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
            let res = [0, 1, 3, 6, 10, 15, 21, 28, 36, 45]
            XCTAssertEqual(arr.cumulate(from: 0, +), res)
        }
        do {
            let arr = [1, 4, 2, 8, 5, 7]
            let res = [0, 1, 5, 7, 15, 20, 27]
            XCTAssertEqual(arr.cumulate(from: 0, +), res)
        }
        do {
            let arr = [1, 4, 2, 8, 5, 7]
            let res = [1, 1, 4, 8, 64, 320, 2240]
            XCTAssertEqual(arr.cumulate(from: 1, *), res)
        }
        do {
            let arr: [String] = ["a", "b", "c", "d", "e" ]
            let res = ["", "a", "ab", "abc", "abcd", "abcde"]
            XCTAssertEqual(arr.cumulate(from: "", +), res)
        }
        do {
            let arr: [String] = ["The", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"]
            let res = ["", "The", "Thequick", "Thequickbrown", "Thequickbrownfox", "Thequickbrownfoxjumps", "Thequickbrownfoxjumpsover", "Thequickbrownfoxjumpsoverthe", "Thequickbrownfoxjumpsoverthelazy", "Thequickbrownfoxjumpsoverthelazydog"]
            XCTAssertEqual(arr.cumulate(from: "", +), res)
        }
        do {
            let arr = [[1], [2, 3], [4, 5, 6], [7, 8, 9, 10]]
            let res = [[], [1], [1, 2, 3], [1, 2, 3, 4, 5, 6], [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]]
            XCTAssertEqual(arr.cumulate(from: [Int](), +), res)
        }
    }

    func testLowerBound() {
        do {
            let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
            XCTAssertEqual(arr.lowerBound(of: 4), 3)
        }
        do {
            let arr = [1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 5, 6, 6, 6]
            XCTAssertEqual(arr.lowerBound(of: 4), 10)
        }
    }

    func testUpperBound() {
        do {
            let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
            XCTAssertEqual(arr.upperBound(of: 4), 4)
        }
        do {
            let arr = [1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 5, 6, 6, 6]
            XCTAssertEqual(arr.upperBound(of: 4), 12)
        }
    }

    func testChunked() {
        do {
            let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
            let res = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
            XCTAssertEqual(arr.chunked(by: 3), res)
        }
        do {
            let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
            let res = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11]]
            XCTAssertEqual(arr.chunked(by: 4), res)
        }
        do {
            let arr = [1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 5, 6, 6, 6]
            let res = [[1, 1, 2, 2, 2, 3, 3], [3, 3, 3, 4, 4, 5, 6], [6, 6]]
            XCTAssertEqual(arr.chunked(by: 7), res)
        }
        do {
            let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
            let res = [[1, 2, 3, 4], [5, 6, 7, 8]]
            XCTAssertEqual(arr.chunked(by: 4, allowDeficit: false), res)
        }
        do {
            let arr = [1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 5, 6, 6, 6]
            let res = [[1, 1, 2, 2, 2, 3, 3], [3, 3, 3, 4, 4, 5, 6]]
            XCTAssertEqual(arr.chunked(by: 7, allowDeficit: false), res)
        }
        do {
            let arr = [1, 2, 3, 4, 5, 6, 7, 8]
            let res = [[1, 2, 3, 4, 5, 6, 7, 8]]
            XCTAssertEqual(arr.chunked(by: 99999), res)
        }
        do {
            let arr = [1, 2, 3, 4, 5, 6, 7, 8]
            let res: [[Int]] = []
            XCTAssertEqual(arr.chunked(by: 99999, allowDeficit: false), res)
        }
        do {
            let arr: [Int] = []
            let res: [[Int]] = []
            XCTAssertEqual(arr.chunked(by: 7), res)
        }
        do {
            let arr: [Int] = []
            let res: [[Int]] = []
            XCTAssertEqual(arr.chunked(by: 7, allowDeficit: false), res)
        }
        do {
            let arr: [String] = ["The", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"]
            let res = [["The", "quick", "brown", "fox", "jumps"], ["over", "the", "lazy", "dog"]]
            XCTAssertEqual(arr.chunked(by: 5), res)
        }
    }

    func testGroupByCount() {
        do {
            let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
            let res = [5: 1, 7: 1, 6: 1, 3: 1, 1: 1, 2: 1, 4: 1, 8: 1, 9: 1]
            XCTAssertEqual(arr.groupByCount(), res)
        }
        do {
            let arr = [1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 5, 6, 6, 6]
            let res = [4: 2, 1: 2, 3: 5, 5: 1, 2: 3, 6: 3]
            XCTAssertEqual(arr.groupByCount(), res)
        }
        do {
            let arr: [String] = ["The", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"]
            let res = ["dog": 1, "lazy": 1, "over": 1, "the": 1, "The": 1, "jumps": 1, "brown": 1, "fox": 1, "quick": 1]
            XCTAssertEqual(arr.groupByCount(), res)
        }
        do {
            let arr: [String] = ["James", "while", "John", "had", "had", "had", "had", "had", "had", "had", "had", "had", "had", "had", "a", "better", "effect", "on", "the", "teacher"]
            let res = ["teacher": 1, "better": 1, "while": 1, "had": 11, "John": 1, "James": 1, "a": 1, "effect": 1, "on": 1, "the": 1]
            XCTAssertEqual(arr.groupByCount(), res)
        }
    }

    func testReversedIndexMap() {
        do {
            let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
            let res = [9: 8, 6: 5, 7: 6, 1: 0, 2: 1, 5: 4, 4: 3, 3: 2, 8: 7]
            XCTAssertEqual(arr.reversedIndexMap(), res)
        }
        do {
            let arr = [1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 5, 6, 6, 6]
            let res = [3: 9, 5: 12, 6: 15, 1: 1, 2: 4, 4: 11]
            XCTAssertEqual(arr.reversedIndexMap(), res)
        }
        do {
            let arr: [String] = ["James", "while", "John", "had", "had", "had", "had", "had", "had", "had", "had", "had", "had", "had", "a", "better", "effect", "on", "the", "teacher"]
            let res = ["James": 0, "a": 14, "John": 2, "the": 18, "teacher": 19, "had": 13, "on": 17, "while": 1, "effect": 16, "better": 15]
            XCTAssertEqual(arr.reversedIndexMap(), res)
        }
    }
}
