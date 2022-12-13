import Foundation

extension Comparable {

    @discardableResult
    mutating func superiorMerge(using value: Self) -> Bool {
        if self < value {
            self = value
            return true
        }
        return false
    }

    @discardableResult
    mutating func inferiorMerge(using value: Self) -> Bool {
        if self > value {
            self = value
            return true
        }
        return false
    }
    
}
