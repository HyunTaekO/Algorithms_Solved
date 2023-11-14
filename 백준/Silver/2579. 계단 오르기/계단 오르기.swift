import Foundation

let n = Int(readLine()!)!
var stairs: [Int] = [0]
var dp = Array(repeating: 0, count: n + 1)

for _ in 0..<n {
    stairs.append(Int(readLine()!)!)
}

func excute() {
    dp[1] = stairs[1]
    dp[2] = stairs[1] + stairs[2]

    for i in 3..<n+1 {
        if i == 3 {
            dp[3] = max(stairs[3]+stairs[1], stairs[3]+stairs[2])
        }else {
            dp[i] = max(stairs[i] + stairs[i-1] + dp[i-3], stairs[i] + dp[i-2])
        }
    }

    print(dp[n])
}

if n <= 2 {
    print(stairs.reduce(0, +))
}else {
    excute()
}
