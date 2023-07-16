let one = readLine()!.map{ String($0) }
let two = readLine()!.map{ String($0) }
var dp = Array(repeating: Array(repeating: 0, count: two.count + 1), count: one.count + 1)
for i in 0..<one.count {
    for j in 0..<two.count {
        if one[i] == two[j] {
            dp[i+1][j+1] = dp[i][j] + 1
        }else {
            dp[i+1][j+1] = max(dp[i][j+1], dp[i+1][j])
        }
    }
}
print(dp[one.count][two.count])