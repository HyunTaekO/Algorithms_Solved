import Foundation

let n = Int(readLine()!)!

var w: [Int] = [0]

for _ in 0..<n {
    w.append(Int(readLine()!)!)
}

var dp = Array(repeating: 0, count: n + 1)
dp[1] = w[1]
if n > 1 { dp[2] = w[1] + w[2] }
if n > 2 {
    for i in 3...n {
        let current = w[i]
        dp[i] = max(dp[i-3] + w[i-1] + current, dp[i-2] + current, dp[i-1])
    }
}


print(dp[n])