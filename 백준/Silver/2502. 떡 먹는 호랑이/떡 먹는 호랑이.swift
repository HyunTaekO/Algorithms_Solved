// f(n) = f(n-1) + f(n-2)
// f(7) = 41이면 f(6) + f(5) = 41
// 첫날 a, 둘째 날 b 라고 가정하면
// 1: a, 2: b, 3: a + b, 4: a + 2b, 5: 2a + 3b, 6: 3a + 5b == 41
import Foundation
let input = readLine()!.split{$0 == " "}.map{Int(String($0))!}
var (d, k) = (input[0], input[1])

var dp = Array(repeating: (0, 0), count: d+1)
dp[1] = (1, 0)
dp[2] = (0, 1)

for i in 3..<d+1 {
    dp[i].0 = dp[i-1].0 + dp[i-2].0
    dp[i].1 = dp[i-1].1 + dp[i-2].1
}

for f in 1..<k {
    let (a, b) = dp[d]
    if (k - (f * a)) % b == 0 {
        print(f)
        print((k - (f * a)) / b)
        break
    }
}

