import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result: [Int] = []
    var s: Set<Int> = []
    for (i, v) in numbers.enumerated() {
        for (i1, v1) in numbers.enumerated() where i1 > i{
            result.append(v + v1)
        }
    }
    s = Set(result)
    result = Array(s)
    let r = result.sorted()
    return r
}