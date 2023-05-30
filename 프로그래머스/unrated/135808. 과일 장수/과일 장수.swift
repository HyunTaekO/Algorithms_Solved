import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    guard m < score.count else {return 0}
    let box: [Int] = score.sorted(by: >)
    var result = 0
    
    for i in m...score.count where i % m == 0 {
        if let min = box[(i-m)...(i-1)].min() {
            result += min * m
        }
    }
    
    
    return result
}