import Foundation
func solution(_ dartResult:String) -> Int {
    var scores = dartResult.split(whereSeparator: { !$0.isNumber }).compactMap { Int($0) }
    var str = dartResult.split(whereSeparator: { $0.isNumber })
    print(scores, str)
    
    for (i, v) in str.enumerated() {
        for j in v {
            let score = scores[i]
            
            if j == "D" {
                scores[i] = score * score
            }else if j == "T"{
                scores[i] = score * score * score
            }else if j == "*" {
                scores[i] = score * 2
                if i != 0 {
                    scores[i-1] *= 2
                }
            }else if j == "#" {
                scores[i] = -score
            }
        }
    }
    
    return scores.reduce(0, +)
}