import Foundation

func solution(_ score:[[Int]]) -> [Int] {
    var sc = 1
    var average = score.enumerated().map{ ($0.offset + 1, (Double($0.element[0] + $0.element[1])) / 2) }
    average = average.sorted(by: { $0.1 > $1.1 })
    var result = average.map{ ($0.0, Int($0.1)) }
    result[0].1 = 1
    for i in 1..<average.count {
        sc += 1
        if average[i].1 < average[i-1].1 {
            result[i].1 = sc
        }else {
            result[i].1 = result[i-1].1
        }
    }
    return result.sorted(by: { $0.0 < $1.0 }).map{ $0.1 }
}