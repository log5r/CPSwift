import Foundation

extension BinaryInteger {

    func binaryDescription(bitWidth: Int? = nil) -> String {
        let bw = bitWidth ?? self.bitWidth
        var res = "", me = self, count = 0
        for _ in 1...bw {
            res.insert(contentsOf: "\(me & 1)", at: res.startIndex)
            me >>= 1
            count += 1
        }
        return res
    }

}
