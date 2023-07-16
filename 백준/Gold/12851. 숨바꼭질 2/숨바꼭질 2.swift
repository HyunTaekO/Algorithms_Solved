let loc = readLine()!.split(separator: " ").map{ Int(String($0))! }
let N = loc[0]
let K = loc[1]
let maxInt = 100002
var dp = Array(repeating: -1, count: maxInt)
dp[N] = 0
var cnt = 1
if N == K {
    print("0")
    print("1")
}else {
    var queue = [N]
    var index = 0
    while index < queue.count {
        let now = queue[index]
        
        let dx = [-1, 1, now]
        let time = dp[now]
        for i in 0..<3 {
            let next = now + dx[i]
            guard next >= 0 && next < maxInt else{ continue }
            if dp[next] == -1 {
                dp[next] = time + 1
                queue.append(next)
                if next == K { cnt = 1 }
            }else if dp[next] > time + 1 {
                dp[next] = time + 1
                queue.append(next)
                if next == K { cnt = 1 }
            }else if dp[next] == time + 1 {
                if next == K { cnt += 1 }
                queue.append(next)
            }
        }
        index += 1
    }
    print("\(dp[K])\n\(cnt)")
}