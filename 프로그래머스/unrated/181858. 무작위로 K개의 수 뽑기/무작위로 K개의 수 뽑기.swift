import Foundation

func solution(_ arr:[Int], _ k:Int) -> [Int] {
    var set: Set<Int> = []
    var result: [Int] = []
    for n in arr {
        let cur = set.count
        if let _ = set.update(with: n) {
            continue
        }else {
            result.append(n)
        }
        if result.count == k { return result }
    }

    while result.count < k {
        result.append(-1)
    }
    return result
}