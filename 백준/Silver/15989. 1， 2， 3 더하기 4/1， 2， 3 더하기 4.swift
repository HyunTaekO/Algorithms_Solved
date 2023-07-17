let T = Int(readLine()!)!
var dp = Array(repeating:0,count:10001)
dp[0] = 1
for k in 1...3 {
    for i in k...10000 {
        dp[i] += dp[i-k]
    }
}
for _ in 0..<T {
    print(dp[Int(readLine()!)!])
}