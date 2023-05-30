import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var dic: [String: Int] = [:]
    var cnt = 0
    var result: [Int] = []
    for kv in 0..<name.count {
        dic[name[kv]] = yearning[kv]
    }
    for (i, v) in photo.enumerated() {
        for (i1, v1) in v.enumerated() {
            if let d = dic[v1] {
                cnt += d
            }
            if v1 == v.last {
                result.append(cnt)
                cnt = 0
            }
        }
    }
   
    return result
}

func addDictionary(_ name: [String], _ yearning: [Int]) {
    
}