import Foundation

func solution(_ A:String, _ B:String) -> Int {
    var result = 0

    var a = A.map{ String($0) }
    let b = B.map{ String($0) }
    for i in 0..<A.count {
        if a == b {
            return result
        }
        a.insert(a.removeLast(), at: 0)
        result += 1   
    }
    return -1
}