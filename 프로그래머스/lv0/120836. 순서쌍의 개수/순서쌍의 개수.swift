import Foundation

func solution(_ n:Int) -> Int {
    guard n != 1 || n != 2 else{ return n == 1 ? 1 : 2}
    var cnt = 0
    for i in 1...n {
        if n % i == 0 {
            cnt += 1
        }
    }
    return cnt
}