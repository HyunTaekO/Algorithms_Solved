import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var result: [Int] = []
    var high: [Int] = []
    
    for (i, v) in score.enumerated() {
        if high.count < k {
            high.append(v)
            result.append(high.min()!)
            continue
        }else if let s = high.min() {
            if v > s {
                high[high.firstIndex(of: s)!] = v
                result.append(high.min()!)
            }else {
                result.append(high.min()!)
                continue
            }
        }
       
    }
    return result
}