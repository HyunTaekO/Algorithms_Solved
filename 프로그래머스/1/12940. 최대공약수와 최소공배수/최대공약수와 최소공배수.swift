func solution(_ n:Int, _ m:Int) -> [Int] {
    var result: [Int] = [0, 0]
    var min = false

    for i in 1...1000000 {
        if n % i == 0 && m % i == 0 {
            result[0] = i
        }
        if i % n == 0 && i % m == 0 && !min {
            result[1] = i
            min = true
        }
        
        if min { break }
    }
    return result
}