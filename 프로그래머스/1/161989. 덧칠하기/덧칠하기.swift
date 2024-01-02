import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var area = Array(repeating: false, count: n * 2)
    var result = 0
    for sec in section {
        if !area[sec] {
            result += 1
            for i in sec..<sec+m {
                area[i] = true
            }
        }
    }
    return result
}