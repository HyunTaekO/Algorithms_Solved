import Foundation

let t = Int(readLine()!)!
var input: [Int] = []
for _ in 0..<t {
    input.append(Int(readLine()!)!)
}
let oneToTen = [0, 1, 1, 1, 2, 2, 3, 4, 5, 7, 9]

for n in input {
    if n <= 10 { print(oneToTen[n]); continue }
    var dp: [Int] = oneToTen + Array(repeating: 0, count: n - 10)
    
    for i in 10...n {
        dp[i] = dp[i-2] + dp[i-3]
    }
    
    print(dp[n])
}