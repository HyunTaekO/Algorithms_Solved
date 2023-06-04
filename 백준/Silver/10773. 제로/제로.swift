var K = Int(readLine()!)!
var money: [Int] = []
for _ in 1...K {
    let m = Int(readLine()!)!
    if m == 0 {
        money.removeLast()
    }else {
        money.append(m)
    }
}
print(money.reduce(0, +))