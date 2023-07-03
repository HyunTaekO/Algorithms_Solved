var n = Int(readLine()!)!
var dp = Array(repeating: 0, count: 1000001) //몇번 움직였는지의 결과를 저장하기위한 배열

if n == 1 {
    print("0")
}else {
    for i in 2...n { //i는 현재 최단경로를 구하고자하는 수
        dp[i] = dp[i - 1] + 1
        
        if i % 2 == 0 {
            dp[i] = dp[i] >= dp[i / 2] + 1 ? dp[i / 2] + 1 : dp[i]
        }
        if i % 3 == 0 {
            dp[i] = dp[i] >= dp[i / 3] + 1 ? dp[i / 3] + 1 : dp[i]
        }
        
    }
    print("\(dp[n])")
}