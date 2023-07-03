let n = Int(readLine()!)!
var arr: [[Int]] = []
var dp = Array(repeating: Array<Int>(), count: n)
for _ in 0..<n {
    arr.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
}
dp[0].append(arr[0][0])
for i in 1..<n {
    for j in 0..<arr[i].count {
        if j == 0 {
            dp[i].append(dp[i-1][0] + arr[i][j])
        }else if j == arr[i].count-1 {
            dp[i].append(dp[i-1][j-1] + arr[i][j])
        }else {
            dp[i].append(max(dp[i-1][j] + arr[i][j],dp[i-1][j-1] + arr[i][j]))
        }
    }
}
print(dp[n-1].max()!)