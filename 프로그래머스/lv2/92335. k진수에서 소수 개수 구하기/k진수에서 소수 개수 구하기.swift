import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    var trans = String(n, radix: k).components(separatedBy: "0").filter{ $0 != "" }.map{ Int($0)! }

    return trans.filter({ prime($0) }).count
}

func prime(_ num: Int) -> Bool {
    if num == 1 { return false }
    if num == 2 { return true }
    for i in 2...Int(sqrt(Double(num))) + 1 {
        if num % i == 0 && i != num {   // 자기 자신이 아닌 수로 나누어 떨어지면
            return false
        }
    }
    return true
}