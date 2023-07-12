let n = Int(readLine()!)!
let num = readLine()!.split(separator: " ").map{ Int(String($0))! }
var dp: [Int] = Array(repeating: 1, count: n)
for i in 0..<n {
    for j in 0..<i {
        if num[j] < num[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}
print(dp.max()!)