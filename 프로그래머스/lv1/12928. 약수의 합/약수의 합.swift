func solution(_ n:Int) -> Int {
    var sum = 0
    guard n >= 0 && n <= 3000 else{return -1}
    guard n != 0 else{return 0}
    guard n != 1 else{return 1}
    for i in 1...n{
        if n % i == 0{
            sum += i
        }
    }
    return sum
}