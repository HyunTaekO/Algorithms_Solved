import Foundation


let t = Int(readLine()!)!
var inputArr: [Int] = []
var dp = Array(repeating: (0, 0), count: 41)
dp[0] = (1, 0)
dp[1] = (0, 1)

for i in 2...40 {
    let zero = dp[i-2].0 + dp[i-1].0
    let one = dp[i-2].1 + dp[i-1].1
    dp[i] = (zero, one)
}


for _ in 0..<t {
    let n = Int(readLine()!)!
    inputArr.append(n)
}

inputArr.forEach{ n in
    print(dp[n].0, dp[n].1)
}