var n = Int(readLine()!)!
var commends: [String] = []
var stack: [Int] = []
for _ in 1...n {
    let commend = readLine()!.split(separator: " ").map{ String($0) }
    let first = commend[0]
    if first == "push" {
        stack.append(Int(commend[1])!)
    }else if first == "pop" {
        if !stack.isEmpty {
            print(stack.popLast()!)
        }else {
            print("-1")
        }
    }else if first == "size" {
        print(stack.count)
    }else if first == "empty" {
        if stack.isEmpty {
            print("1")
        }else {
            print("0")
        }
    }else if first == "top" {
        if let last = stack.last {
            print(last)
        }else {
            print("-1")
        }
    }
}