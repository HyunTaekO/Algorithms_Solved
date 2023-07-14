import Foundation
let MNH = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let M = MNH[0]
let N = MNH[1]
let H = MNH[2]
var box: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0, count: M), count: N), count: H)
for i in 0..<H {
    for j in 0..<N {
        box[i][j] = readLine()!.split(separator: " ").map{ Int(String($0))! }
    }
}
var stack: [(Int, Int, Int)] = []
let dx = [-1, 1, 0, 0, 0, 0]
let dy = [0, 0, -1, 1, 0, 0]
let dz = [0, 0, 0, 0, -1, 1]

var depth = 0
for h in 0..<H {
    for n in 0..<N {
        for m in 0..<M {
            if box[h][n][m] == 1 {
                stack.append((h, n, m))
            }
        }
    }
}
var stack2: [(Int, Int, Int)] = []
func bfs() {
    while !stack.isEmpty {
        stack2.removeAll()
        depth += 1
        for _ in 0..<stack.count {
            let pop = stack.removeLast()
            let h = pop.0
            let n = pop.1
            let m = pop.2
            for i in 0..<6 {
                let nz = h + dz[i]
                let nx = n + dx[i]
                let ny = m + dy[i]
                guard nx >= 0 && nx < N && ny >= 0 && ny < M && nz >= 0 && nz < H else{ continue }
                guard box[nz][nx][ny] == 0 else{ continue }
                box[nz][nx][ny] = 1
                stack2.append((nz, nx, ny))
            }
        }
        stack = stack2
    }
}
bfs()
var check = true
for h in 0..<H {
    for n in 0..<N {
        for m in 0..<M {
            if box[h][n][m] == 0 {
                check = false
            }
        }
    }
}
if check {
    print(depth-1)
}else {
    print("-1")
}