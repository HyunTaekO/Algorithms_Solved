import Foundation

func solution(_ n:Int) -> Int {
    let num = Array(2...10)
    var fac = 1
    for i in num {
        fac *= i
        if fac > n {
            return i - 1
        }else if fac == n {
            return i
        }
    }
    return 0
}