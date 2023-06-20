import Foundation

let hw = readLine()!.split(separator: " ").map{ Int(String($0))!}
let h = hw[0]
let w = hw[1]

let block = readLine()!.split(separator: " ").map{ Int(String($0))!}
var mapArr = Array(repeating: Array(repeating: 1, count: w), count: h)
var result = 0
for b in 0..<block.count {
    for i in 0..<h-block[b] {
        mapArr[i][b] = 0
    }
}
var c = false
var cnt = 0
for map in mapArr {
    c = false
    for m in 0..<map.count {
        if m == map.count-1 {
            if map[m] == 1 {
                result += cnt
            }
            cnt = 0
            break
        }
        if c {
            if map[m] == 0 {
                cnt += 1
            }else {
                result += cnt
                cnt = 0
            }
        }else {
            if map[m] == 1 {
                c = true
            }
        }
    
    }
}
print(result)