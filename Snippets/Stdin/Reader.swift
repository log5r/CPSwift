// atcoder-toolsに依存している限り使用しないのでまだ雑
import Foundation

struct CINStream {
    private var tokens = [String]()
    private var idx = 0

    mutating func peek() -> String {
        while tokens.count == idx {
            tokens = readLine()!.split(separator: " ").map(\.description)
            idx = 0
        }
        return tokens[idx]
    }

    mutating func single() -> String {
        defer { idx += 1 }
        return peek()
    }
    mutating func array() -> [String] { (0..<tokens.count).map { _ -> String in single() } }
    mutating func array(count n: Int) -> [String] { (0..<n).map { _ -> String in single() } }
}
