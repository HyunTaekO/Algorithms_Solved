import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var sum = 0
    for (index, i) in absolutes.enumerated() {
        if signs[index] {
            sum += i
        }else {
            sum -= i
        }
    }
    return sum
}