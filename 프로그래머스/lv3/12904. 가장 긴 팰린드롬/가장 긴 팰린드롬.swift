import Foundation

func solution(_ s:String) -> Int {
    guard s.count > 1 else{ return 1 }
    let str = s.map{ String($0) }
    var result = 0
    var dp = Array(repeating: Array(repeating: 0, count: s.count), count: s.count)
    
    for i in 0..<dp.count {
        dp[i][i] = 1
        result = 1
    }
    
    for i in 0..<dp.count-1 {
        if str[i] == str[i+1] {
            dp[i][i+1] = 1
            result = 2
        }
    }
    guard s.count > 2 else{ return result }
    for k in 3...dp.count {
        for i in 0..<dp.count-k+1 {
            let j = i + k - 1
            if dp[i+1][j-1] == 1 && str[i] == str[j] {
                dp[i][j] = 1
                result = k
            }
        }
    }
    return result
}