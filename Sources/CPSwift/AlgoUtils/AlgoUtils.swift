import Foundation

// 自動補完前提の関数が多い

class LoopUtils {
    static func `repeat`(count: Int, _ f: () -> ()) { for _ in 0..<count { f() } }
}
