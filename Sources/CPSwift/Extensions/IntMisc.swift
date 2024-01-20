extension Int {

    func zeroStartRange() -> Range<Int> { 0..<(self > 0 ? self : 0) }
    func oneStartRange() -> Range<Int> { 1..<(self > 1 ? self : 1) }
    func timesLoop(_ f:(Int) -> ()) {
        for i in 0..<self { f(i) }
    }

    func sqrt() -> Int {
        Int(Double(self).squareRoot())
    }
    
    func prod(_ value: Int, mod: Int? = nil) -> Int {
        let result: (Int, Int)
        if value > self { result = (self, value)}
        else { result = (value, self) }
        var (a, b) = result
        var res = 0
        while b > 0 {
            if (b & 1) != 0 { res += a }
            if let m = mod { res %= m }
            if let m = mod { a %= m }
            a *= 2
            if let m = mod { a %= m }
            b >>= 1
        }
        return res
    }

    func pow(_ ex: Int, mod: Int? = nil) -> Int {
        var res = 1, n = ex, a = self
        while n > 0 {
            if (n & 1) != 0 {
                res *= a
                if let m = mod { res %= m }
            }
            a *= a
            if let m = mod { a %= m }
            n >>= 1
        }
        return res
    }

    func divisors() -> [Int] {
        precondition(self >= 1)
        var result = [Int]()
        var i = 1
        while i * i <= self {
            if self % i == 0 {
                result.append(i)
                if i * i != self { result.append(self / i) }
            }
            i += 1
        }
        return result.sorted()
    }
}
