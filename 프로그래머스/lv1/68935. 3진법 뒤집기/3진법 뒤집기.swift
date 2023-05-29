import Foundation

func solution(_ n:Int) -> Int {
    var th = String(n, radix: 3)
    var str = ""
    for i in th.reversed() {
        str += String(i)
    }
    return Int(str, radix: 3)!
}