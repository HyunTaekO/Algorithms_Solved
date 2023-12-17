// 1. 키트를 사용할 수 있는 순열을 구하기 * 중복 허용 안하는 순열로
// 2. 구한 순열을 순회하면서 운동기간동안 중량 500을 유지할 수 있는지 구하기
// 3. 2가 가능하다면 경우의수 +1

import Foundation

let nk = readLine()!.split{$0 == " "}.map{Int($0)!}
let (n, k) = (nk[0], nk[1])
let kits = readLine()!.split{$0 == " "}.map{ Int($0)! }

func p() -> [[Int]] {
    var arr: [[Int]] = []
    var visited = Array(repeating: false, count: n)
    
    func recur(_ temp: [Int]) {
        if temp.count == n {
            arr.append(temp)
            return
        }
        
        for i in 0..<n {
            if !visited[i] {
                visited[i] = true
                recur(temp + [kits[i]])
                visited[i] = false
            }
        }
    }
    recur([])
    return arr
}

let permutation = p()
var result = 0

for kit in permutation {
    var weight = 500
    for i in 0..<kit.count {
        weight -= k
        weight += kit[i]
        if weight < 500 { break }
    }
    
    if weight >= 500 { result += 1 }
}

print(result)
