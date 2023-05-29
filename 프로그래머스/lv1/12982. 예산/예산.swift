import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var sum = 0
    var result = 0
    for i in d.sorted() {
        sum += i
        if sum > budget {
            return result
        }
        result += 1
    }
    return result
}