import Foundation

func solution(_ s:String) -> Int {
    let dic: [String: String] = ["0": "zero", "1" : "one", "2": "two", "3": "three", "4": "four", "5": "five", "6": "six", "7": "seven", "8": "eight", "9": "nine"]
    var result = s
    for (k, v) in dic {
        if result.contains(v) {
            result = result.replacingOccurrences(of: v, with: k)
        }
    }



    return Int(result)!
}