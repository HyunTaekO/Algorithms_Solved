import Foundation

func solution(_ s:String) -> Int {
    let arr = s.split(separator: " ").map{ String($0) }
    var result = 0
    for i in 0..<arr.count {
        if arr[i] == "Z" {
            result -= (Int(arr[i-1])!)
        }else {
            result += Int(arr[i])!
        }
    }
    return result
}