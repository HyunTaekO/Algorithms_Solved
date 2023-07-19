let t = Int(readLine()!)!
var prices: [[Int]] = []
for _ in 0..<t {
    let _ = Int(readLine()!)!
    prices.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
}
for price in prices {
    var max = 0
    var result = 0
    for i in price.reversed() {
        if i >= max {
            max = i
        }else {
            result += max - i
        }
    }
    print(result)
}