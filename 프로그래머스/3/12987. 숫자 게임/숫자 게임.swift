import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var result = 0
    let sortA = a.sorted(by: <)
    var sortB = b.sorted(by: <)
    var idx = 0
    for i in 0..<sortA.count {
        while idx < sortB.count {
            if sortB[idx] > sortA[i] {
                result += 1
                idx += 1
                break
            }
            idx += 1
        }
    }
    return result
}