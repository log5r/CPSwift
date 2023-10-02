import Foundation

extension String {
    func match(_ pattern: String) -> Bool {
        matchedResult(pattern) != nil
    }

    func extractFirstMatched(_ pattern: String) -> [String] {
        guard let matched = matchedResult(pattern) else { return [] }
        return (0..<matched.numberOfRanges).compactMap { i -> String? in
            let matchedRange = matched.range(at: i)
            guard matchedRange.location != NSNotFound else { return nil }
            return NSString(string: self).substring(with: matchedRange)
        }
    }

    private func matchedResult(_ pattern: String) -> NSTextCheckingResult? {
        let range = NSRange(location: 0, length: self.count)
        let regex = try? NSRegularExpression(pattern: pattern)
        return regex?.firstMatch(in: self, range: range)
    }
}
