let nk = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nk[0]
var k = nk[1]
var coin: [Int] = []
var result = 0
for _ in 0..<n {
    coin.append(Int(readLine()!)!)
}
coin = coin.reversed()
for i in coin {
    if i <= k {
        result += k / i
        k %= i
    }else {
        continue
    }
}
print(result)