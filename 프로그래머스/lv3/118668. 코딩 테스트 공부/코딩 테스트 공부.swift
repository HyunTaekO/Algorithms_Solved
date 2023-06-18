import Foundation

func solution(_ alp:Int, _ cop:Int, _ problems:[[Int]]) -> Int {
    var max_alp_req = 0
    var max_cop_req = 0
    
    for problem in problems {
        max_alp_req = max(max_alp_req, problem[0])
        max_cop_req = max(max_cop_req, problem[1])
    }
    
    var dp = [[Float]](repeating: [Float](repeating: Float.infinity, count: max_cop_req + 1), count: max_alp_req + 1)
    
    let alp = min(alp, max_alp_req)
    let cop = min(cop, max_cop_req)
    
    dp[alp][cop] = 0
    
    for i in alp...max_alp_req {
        for j in cop...max_cop_req {
            if i < max_alp_req {
                dp[i + 1][j] = min(dp[i + 1][j], dp[i][j] + 1)
            }
            if j < max_cop_req {
                dp[i][j + 1] = min(dp[i][j + 1], dp[i][j] + 1)
            }
            
            for pro in problems {
                if i >= pro[0] && j >= pro[1] {
                    let new_alp = min(i + pro[2], max_alp_req)
                    let new_cop = min(j + pro[3], max_cop_req)
                    dp[new_alp][new_cop] = min(dp[new_alp][new_cop], dp[i][j] + Float(pro[4]))
                }
            }
        }
    }
    
    return Int(dp[max_alp_req][max_cop_req])
}
    
  