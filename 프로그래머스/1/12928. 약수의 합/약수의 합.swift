// 백준허브 AutoPush Test

func solution(_ n:Int) -> Int {
    guard n > 0 else{ return 0 }
    var result = 0
    for i in 1...n {
        if n % i == 0 {
            result += i
        }
    }
    return result
}