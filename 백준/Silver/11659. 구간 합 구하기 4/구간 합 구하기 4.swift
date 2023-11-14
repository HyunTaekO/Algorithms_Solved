import Foundation

let nm = readLine()!.split{$0 == " "}.map{ Int(String($0))! }
let (n, m) = (nm[0], nm[1])

var numbers = [0] + readLine()!.split{$0 == " "}.map{ Int(String($0))! }

var cases: [(Int, Int)] = []

for _ in 0..<m {
    let input = readLine()!.split{$0 == " "}.map{ Int(String($0))! }
    cases.append((input[0]-1, input[1]))
}

for i in 1..<numbers.count {
    numbers[i] += numbers[i-1]
}
cases.forEach{ print(numbers[$0.1] - numbers[$0.0]) }
