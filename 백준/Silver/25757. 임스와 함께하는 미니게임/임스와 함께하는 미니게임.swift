import Foundation
let ng = readLine()!.components(separatedBy: " ")
let n = Int(ng[0])!
let g = ng[1]
var peoples: [String] = []
var player = 0
if g == "Y" {
    player = 2
}else if g == "F" {
    player = 3
}else {
    player = 4
}
for _ in 0..<n {
    let name = readLine()!
    peoples.append(name)
}
var setP: Set<String> = Set(peoples)
peoples = Array(setP)
var cnt = 1
var result = 0
for _ in 0..<peoples.count {
    cnt += 1
    if cnt == player {
        cnt = 1
        result += 1
    }
}
print(result)