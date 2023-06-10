struct CyclicArray<T> {
    let array: Array<T>
    init(_ array: Array<T>) {
        self.array = array
    }
    subscript(index: Int) -> T {
        let newIndex = ((index % array.count) + array.count) % array.count
        return array[newIndex]
    }
    func arraySlice(fromIndex: Int, count: Int? = nil) -> ArraySlice<T> {
        let c = count ?? array.count
        let fi = ((fromIndex % array.count) + array.count) % array.count
        var lpc = (c / array.count) + 1
        var buf = array
        while lpc > 0 {
            buf += array
            lpc -= 1
        }
        return buf[fi..<(fi + c)]
    }
}
