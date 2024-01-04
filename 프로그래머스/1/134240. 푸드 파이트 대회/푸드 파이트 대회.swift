import Foundation

func solution(_ food:[Int]) -> String {
    var result = ""
    for i in 1..<food.count {
        let str = String(repeating: String(i), count: food[i] / 2)
        result += str
    }
    let second = String(result.reversed())
    result += "0"
    result += second
    return result
}