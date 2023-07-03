let t = Int(readLine()!)!

for _ in 0..<t {
    let k = Int(readLine()!)!
    let n = Int(readLine()!)!
    
    var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: k + 1)
    for i in 1...n {
        dp[0][i] = i
    }
    
    for s in 1...k {
        for i in 1...n {
            dp[s][i] = dp[s-1][1...i].reduce(0, +)
        }
    }
    print(dp[k][n])
}