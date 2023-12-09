import Foundation

func solution(_ lines:[[Int]]) -> Int {
    var dp = Array(repeating: 0, count: 202)
    for line in lines {
        let start = line[0] + 100
        let end = line[1] + 100
        for i in start..<end {
            dp[i] += 1
        }
    }
    return dp.filter{ $0 > 1 }.count
}