let nk = readLine()!.split(separator: " ").map{ Int($0)! }
let (n, k) = (nk[0], nk[1])

var wArr: [Int] = []
var vArr: [Int] = []
var dp = Array(repeating: 0, count: k + 1)
for _ in 0..<n {
    let wv = readLine()!.split(separator: " ").map{ Int($0)! }
    let (w, v) = (wv[0], wv[1])
    wArr.append(w)
    vArr.append(v)
}
for i in 0..<n {
    for j in stride(from: k, to: 0, by: -1) {
        if j >= wArr[i] {
            dp[j] = max(dp[j], dp[j-wArr[i]] + vArr[i])
        }
    }
}
print(dp[k])