import Foundation

let count = Int(readLine()!)!
var inputs: [Int] = []
var stack: [Int] = []
var result: [String] = []

for _ in 0..<count {
    let num = Int(readLine()!)!
    inputs.append(num)
}
inputs.reverse()

for i in 1...count {
    if let top = stack.last, top == inputs.last! {
        result.append("-")
        stack.removeLast()
    } else {
        result.append("+")
        stack.append(i)
        
        while !stack.isEmpty {
            if let top = stack.last, top == inputs.last! {
                result.append("-")
                stack.removeLast()
                inputs.removeLast()
            } else {
                break
            }
        }
    }
}

if inputs.isEmpty {
    for s in result {
        print("\(s)")
    }
} else {
    print("NO")
}