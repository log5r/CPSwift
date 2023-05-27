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
    func makeIterator() -> StringIterator {
        StringIterator(string: self)
    }
    func asciiIntValues() -> [Int]? {
        var res = [Int]()
        for v in values() {
            guard let vav = v.asciiIntValue() else { return nil }
            res.append(vav)
        }
        return res
    }
    subscript(_ index: Int) -> Character {
        get {
            values()[index]
        }
        set {
            var buf = values()
            buf[index] = newValue
            self = String(buf)
        }
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

struct StringIterator: IteratorProtocol {
    let string: String
    var index: Int = 0
    public mutating func next() -> Character? {
        let buf = string.values()
        guard index < buf.count else { return nil }
        defer { index += 1 }
        return buf[index]
    }
}
