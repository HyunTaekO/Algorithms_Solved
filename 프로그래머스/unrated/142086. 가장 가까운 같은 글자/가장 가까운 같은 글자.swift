import Foundation

func solution(_ s:String) -> [Int] {
    var dic: [String: Int] = [:]
    var result: [Int] = []
    for (i, v) in s.enumerated() {
        if let d = dic[String(v)] {
            result.append(i - d)
            dic[String(v)] = i
        }else {
            dic[String(v)] = i
            result.append(-1)
        }
    }
    
    return result
}