func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    var result: [Int] = []
    result = arr.filter { $0 % divisor == 0 }.sorted()
    if result.isEmpty {
        result.append(-1)
    }
    return result
}