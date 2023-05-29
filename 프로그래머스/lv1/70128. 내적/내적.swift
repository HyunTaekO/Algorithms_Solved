import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var result = 0
    for (index, v) in a.enumerated() {
        result += v * b[index]
    }
    return result
}