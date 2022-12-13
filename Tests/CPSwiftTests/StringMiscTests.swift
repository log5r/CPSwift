import XCTest
@testable import CPSwift

final class StringMiscTests: XCTestCase {

    func testAsciiIntValue() {
        let v = ("a" as Character).asciiIntValue()
        XCTAssertNotNil(v)
        XCTAssertEqual(v!, 97)

        XCTAssertNil(("黒" as Character).asciiIntValue())
        XCTAssertNil(("ê" as Character).asciiIntValue())
        XCTAssertNil(("ш" as Character).asciiIntValue())
        XCTAssertNil(("😭" as Character).asciiIntValue())
    }

    func testIsUppercaseAlphabet() {
        XCTAssertTrue(("A" as Character).isUppercaseAlphabet())
        XCTAssertFalse(("a" as Character).isUppercaseAlphabet())
        XCTAssertFalse(("黒" as Character).isUppercaseAlphabet())
        XCTAssertFalse(("ê" as Character).isUppercaseAlphabet())
        XCTAssertFalse(("ш" as Character).isUppercaseAlphabet())
        XCTAssertFalse(("😭" as Character).isUppercaseAlphabet())
    }

    func testIsLowercaseAlphabet() {
        XCTAssertTrue(("a" as Character).isLowercaseAlphabet())
        XCTAssertFalse(("A" as Character).isLowercaseAlphabet())
        XCTAssertFalse(("黒" as Character).isLowercaseAlphabet())
        XCTAssertFalse(("ê" as Character).isLowercaseAlphabet())
        XCTAssertFalse(("ш" as Character).isLowercaseAlphabet())
        XCTAssertFalse(("😭" as Character).isLowercaseAlphabet())
    }

    func testIsAlphabet() {
        let X = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        let x = Array("abcdefghijklmnopqrstuvwxyz")
        for c: Character in X {
            XCTAssertTrue(c.isAlphabet())
        }
        for c: Character in x {
            XCTAssertTrue(c.isAlphabet())
        }
        XCTAssertFalse(("黒" as Character).isAlphabet())
        XCTAssertFalse(("ê" as Character).isAlphabet())
        XCTAssertFalse(("ш" as Character).isAlphabet())
        XCTAssertFalse(("😭" as Character).isAlphabet())

    }

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

    func testBitArray() {
        let str = "010010011110010100101101"
        let exc = [false, true, false, false, true, false, false, true, true, true, true, false, false, true, false, true, false, false, true, false, true, true, false, true]
        let res = str.bitArray()
        XCTAssertNotNil(res)
        XCTAssertEqual(res!, exc)

        let estr = "00110101001O10010"
        XCTAssertNil(estr.bitArray())
    }
}