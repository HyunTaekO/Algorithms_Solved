import Foundation

func solution(_ n:Int) -> Int {
    var arr = Array(1...200)
    var result: [Int] = []
    for i in 0..<arr.count {
        if arr[i] % 3 == 0 || String(arr[i]).contains("3") {
            continue
        }else {
            result.append(arr[i])
        }
    }
    return result[n - 1]
}