func solution(_ num:Int) -> Int {
    guard num != 1 else {return 0}
    var count = 0
    var n = num
    
    while count < 500 {
        if n % 2 == 0 {
            n /= 2
        }else if n % 2 != 0 {
            n = n * 3 + 1
        }
        count += 1
        if n == 1 {
            return count
        }
        
    }
    return -1
}