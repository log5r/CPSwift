import Foundation

/*
 force-unwrapping については議論の余地があるが、バックトレースで辿れるように分けたつもり...
 */


extension Character {
    func asciiIntValue() -> Int? { Int(asciiValue!) }
    func isUppercaseAlphabet() -> Bool { (65...90) ~= asciiIntValue()! }
    func isLowercaseAlphabet() -> Bool { (97...122) ~= asciiIntValue()! }
    func isAlphabet() -> Bool { isUppercaseAlphabet() || isLowercaseAlphabet() }
}

extension String {
    func values() -> [Character] { Array(self) }
    func asciiIntValues() -> [Int]? { values().map { $0.asciiIntValue()! } }
}
