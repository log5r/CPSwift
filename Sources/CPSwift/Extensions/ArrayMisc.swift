extension Array {
    func cumulate(from start: Element, _ method: (Element, Element) -> Element) -> [Element] {
        guard count > 0 else { return []}
        var res = [Element](repeating: start, count: count + 1)
        for i in 0..<count {
            res[i + 1] = method(res[i], self[i])
        }
        return res
    }
}

extension Array where Element: CustomStringConvertible {
    func contestDescription(separator: String = " ") -> String {
        self.map(\.description).joined(separator: separator)
    }
}

extension Array where Element: Comparable {

    func lowerBound(of item: Element) -> Index {
        var (left, right) = (0, count)
        while left < right {
            let mid = (left + right) >> 1
            if self[mid] >= item { right = mid }
            else { left = mid + 1 }
        }
        return left
    }

    func upperBound(of item: Element) -> Index {
        var (left, right) = (0, count)
        while left < right {
            let mid = (left + right) >> 1
            if self[mid] <= item { left = mid + 1}
            else { right = mid }
        }
        return left
    }

    func chunked(by chunkSize: Int, allowDeficit: Bool = true) -> [[Element]] {
        let res = stride(from: 0, to: count, by: chunkSize).map { i in
            Array(self[i..<Swift.min(i + chunkSize, count)])
        }
        guard let head = res.first, let tail = res.last else { return [] }
        if !allowDeficit {
            if head.count != tail.count { return res.dropLast() }
            if res.count == 1           { return [] }
        }
        return res
    }

    func firstMaxIndex(after index: Int = 0) -> Int? {
        guard let maxValue = self.max() else { return nil }
        return self[index..<self.count].firstIndex(of: maxValue)
    }

    func firstMinIndex(after index: Int = 0) -> Int? {
        guard let minValue = self.min() else { return nil }
        return self[index..<self.count].firstIndex(of: minValue)
    }
}

extension Array where Element: Hashable {
    func groupByCount() -> [Element: Int] {
        var res: [Element: Int] = [:]
        for item in self { res[item, default: 0] += 1 }
        return res
    }
    func reversedIndexMap() -> [Element: Int] {
        enumerated().reduce(into: [Element: Int]()) { (pr: inout [Element: Int], tuple: (offset: Int, element: Element)) in
            pr[tuple.element] = tuple.offset
        }
    }
}
