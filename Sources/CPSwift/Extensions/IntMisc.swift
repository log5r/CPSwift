import Foundation

extension Int {
    func sqrt() -> Int {
        Int(Double(self).squareRoot())
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
