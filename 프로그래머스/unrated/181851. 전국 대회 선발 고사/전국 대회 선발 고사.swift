import Foundation

func solution(_ rank:[Int], _ attendance:[Bool]) -> Int {
    var good: [[Int]] = []
    for i in 0..<rank.count {
        if attendance[i] {
            good.append([rank[i], i])
        }
    }
    let newR = good.sorted(by: { $0[0] < $1[0] })
    
    return newR[0][1] * 10000 + newR[1][1] * 100 + newR[2][1]
}