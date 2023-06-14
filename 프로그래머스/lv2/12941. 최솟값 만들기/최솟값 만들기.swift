import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    let a = A.sorted()
    let b = B.sorted(by: >)
    var result = 0
    for i in 0..<a.count {
        result += a[i]  * b[i]
    }
    return result
}