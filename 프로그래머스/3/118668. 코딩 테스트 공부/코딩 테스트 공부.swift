import Foundation
// 알고력 코딩력 1 높이기: 1 시간 or 문제풀기

func solution(_ alp:Int, _ cop:Int, _ problems:[[Int]]) -> Int {
    var maxAlp = problems.map{ $0[0] }.max()!
    var maxCop = problems.map{ $0[1] }.max()!
    var dp = Array(repeating: Array(repeating: Int.max, count: maxCop + 1), count: maxAlp + 1)
    let alp = min(alp, maxAlp)
    let cop = min(cop, maxCop)
    dp[alp][cop] = 0
    for i in alp..<maxAlp+1 {
        for j in cop..<maxCop+1 {
            var flag = false
            // 알고력 +1
            if i + 1 <= maxAlp {
                dp[i+1][j] = min(dp[i+1][j], dp[i][j]+1)
                flag = true
            }
            // 코딩력 +1
            if j + 1 <= maxCop {
                dp[i][j+1] = min(dp[i][j+1], dp[i][j]+1)
                flag = true
            }
            guard flag else{ continue }
            // 문제를 풀 경우
            for problem in problems {
                let (alp_req, cop_req, alp_rwd, cop_rwd, cost) = (problem[0], problem[1], problem[2], problem[3], problem[4])
                guard i >= alp_req && j >= cop_req else{ continue }
                let totalAlp = min(maxAlp, i + alp_rwd)
                let totalCop = min(maxCop, j + cop_rwd)
                dp[totalAlp][totalCop] = min(dp[totalAlp][totalCop], dp[i][j]+cost)
            }
        }
    }
    
    return dp[maxAlp][maxCop]
}