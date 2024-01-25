import Foundation

func solution(_ s:String) -> [Int] {
    var zeros = 0
    var trans = 0
    var s = s
    while s.count > 1 {
        let del = s.filter{$0 == "1"}
        zeros += s.count - del.count
        s = String(del.count, radix: 2)
        trans += 1
    }
    return [trans, zeros]
}
