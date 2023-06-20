import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var los = lost.sorted()
    var reserve = reserve.sorted()
    var rem: [Int] = []
    var result = 0
    for (i, v) in reserve.enumerated() {
        if los.contains(v) {
            los.remove(at: los.firstIndex(of: v)! )
            rem.append(i)
            continue 
        }
    }

    for i in 0..<reserve.count {
        if rem.contains(i) { continue }
        if let f = los.firstIndex(of: reserve[i] - 1) {
            los.remove(at: f)
            result += 1
            continue
        }else if let b = los.firstIndex(of: reserve[i] + 1) {
            los.remove(at: b)
            result += 1
        }
    }
    return n - los.count
}