func solution(_ num:Int) -> Int {
    var result = 0
    var n = num
    while n > 1 {
        if result == 500 { return -1 }
        if n % 2 == 0 {
            n /= 2
        }else {
            n = n * 3 + 1
        }
        result += 1
    }
    return result
}