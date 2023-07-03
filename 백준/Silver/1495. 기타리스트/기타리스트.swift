let nsm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nsm[0] //연주할 곡의 개수
let s = nsm[1] // 시작볼륨
let m = nsm[2] // 최대볼륨

let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var dp = Array(repeating: Array(repeating: false, count: 1001), count: 51)
if s + arr[0] <= m {
    dp[1][s + arr[0]] = true
}
if s - arr[0] >= 0 {
    dp[1][s - arr[0]] = true
}
for i in stride(from: 2, through: n, by: 1){
    for j in 0...m{
        if dp[i - 1][j]{
            if j - arr[i - 1] >= 0 {
                dp[i][j - arr[i - 1]] = true
            }
            if j + arr[i - 1] <= m {
                dp[i][j + arr[i - 1]] = true
            }
        }
    }
}
var idx = -1
for i in stride(from: m, through: 0, by: -1){
    if dp[n][i]{
        idx = i
        break
    }
}
print(idx)