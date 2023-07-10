let input = readLine()!
var split = input.split{ $0 == "-" }.map{ String($0) }
for i in 0..<split.count {
    if split[i].contains("+") {
        split[i] = String(split[i].split(separator: "+").map{ Int($0)! }.reduce(0, +))
    }
}
var result = split.map{ Int(String($0))! }
print(result.reduce(result[0], { $0 - $1 })+result[0])