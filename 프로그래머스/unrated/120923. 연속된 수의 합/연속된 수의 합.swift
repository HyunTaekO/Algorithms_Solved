import Foundation

func solution(_ num:Int, _ total:Int) -> [Int] {
    var arr = Array(-1000..<1000)
    var (left, right) = (0, num)
    while right <= arr.count {
        let result = arr[left..<right]
        if result.reduce(0, +) == total {
            return Array(result)
        }
        left += 1
        right += 1
    }
    return [-1]
}