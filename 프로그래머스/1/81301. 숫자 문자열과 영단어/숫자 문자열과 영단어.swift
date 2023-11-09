import Foundation

func solution(_ s:String) -> Int {
    var result: String = s
    let numbers: [String] = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    for i in 0...9 {
        result = result.replacingOccurrences(of: numbers[i], with: String(i))
    }
    return Int(result)!
}