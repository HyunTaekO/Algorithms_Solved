func solution(_ n:Int) -> Int {
    var memo = Array(repeating: 0, count: n+1)
    memo[0] = 0
    memo[1] = 1
    for i in 2..<memo.count {
        memo[i] = (memo[i-1] + memo[i-2]) % 1234567
    }
    return memo[n] 
}