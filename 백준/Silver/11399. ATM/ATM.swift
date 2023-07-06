let n = Int(readLine()!)!
var sum: [Int] = Array(repeating: 0, count: n)
let input = readLine()!.split(separator: " ").map{ Int(String($0))! }.sorted()
sum[0] = input[0]
for i in 1..<n {
    sum[i] = sum[i-1] + input[i]
}
print(sum.reduce(0, +))