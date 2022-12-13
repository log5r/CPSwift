import Foundation

/*
 force-unwrapping については議論の余地があるが、バックトレースで辿れるように分けたつもり...
 */


extension Character {
    func asciiIntValue() -> Int? {
        guard let ascv = asciiValue else { return nil }
        return Int(ascv)
    }
    func isUppercaseAlphabet() -> Bool {
        guard let aiv = asciiIntValue() else { return false }
        return (65...90) ~= aiv
    }
    func isLowercaseAlphabet() -> Bool {
        guard let aiv = asciiIntValue() else { return false }
        return (97...122) ~= aiv
    }
    func isAlphabet() -> Bool { isUppercaseAlphabet() || isLowercaseAlphabet() }
}

extension String {
    func values() -> [Character] { Array(self) }
    func asciiIntValues() -> [Int]? {
        var res = [Int]()
        for v in values() {
            guard let vav = v.asciiIntValue() else { return nil }
            res.append(vav)
        }
        return res
    }
    func bitArray() -> [Bool]? {
        var res = [Bool]()
        for c in values() {
            switch c {
            case "1": res.append(true)
            case "0": res.append(false)
            default: return nil
            }
        }
        return res
    }
}
