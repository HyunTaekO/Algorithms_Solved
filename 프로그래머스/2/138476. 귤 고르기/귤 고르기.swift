import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    var result = 0
    var k = k
    var dic: [Int: Int] = [:]
    for t in tangerine {
        if let _ = dic[t] {
            dic[t]! += 1 
        }else {
            dic[t] = 1
        }
    }
    let arr = dic.keys.sorted(by: { dic[$0]! > dic[$1]! })
    for a in arr {
        k -= dic[a]!
        result += 1
        if k <= 0 { break }
    }
    return result
}