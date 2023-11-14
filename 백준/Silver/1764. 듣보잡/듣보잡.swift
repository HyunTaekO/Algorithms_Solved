import Foundation

let nm = readLine()!.split{ $0 == " "}.map{ Int(String($0))! }
let (n, m) = (nm[0], nm[1])

var hear: Set<String> = []
var see: Set<String> = []

for _ in 0..<n {
    hear.insert(readLine()!)
}

for _ in 0..<m {
    see.insert(readLine()!)
}

let result = hear.intersection(see)

print(result.count)

result.sorted(by: < ).forEach{ print($0) }


