import Foundation

let M = Int(readLine()!)!
var cup = Array(repeating: false, count: 4)
cup[1] = true
var cArr: [[Int]] = []
for _ in 0..<M {
    let change = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    cArr.append(change)
}
for i in cArr {
    if cup[i[0]] {
        cup[i[0]] = false
        cup[i[1]] = true
    }else if cup[i[1]] {
        cup[i[0]] = true
        cup[i[1]] = false
    }
}

print(cup.firstIndex(of: true)!)