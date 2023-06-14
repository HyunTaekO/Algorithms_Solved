import Foundation

func solution(_ targets:[[Int]]) -> Int {
    var result = 0
    let target = targets.sorted(by: { $0[1] < $1[1] })
    var e = 0
    
    for v in target {
        if v[0] >= e {
            result += 1
            e = v[1]
        }
    }
    return result
}