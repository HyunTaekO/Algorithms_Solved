let t = Int(readLine()!)!
var dp = Array(repeating: 0, count: 11)
var input: [Int] = []
for _ in 0..<t {
    let n = Int(readLine()!)!
    input.append(n)
}
dp[1] = 1
dp[2] = 2
dp[3] = 4
for i in 4..<11 {
    dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
}
for i in input {
    print(dp[i])
}