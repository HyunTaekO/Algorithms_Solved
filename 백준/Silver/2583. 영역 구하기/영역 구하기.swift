import Foundation

let MNK = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let m = MNK[0],
n = MNK[1],
k = MNK[2]

var paper = Array(repeating: Array(repeating: false, count: n), count: m)
var rects: [[Int]] = []
var result: [Int] = []

for _ in 0..<k {
    let input = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    rects.append(input)
}
for rect in rects {
    for y in rect[0]...rect[2]-1 {
        for x in rect[1]...rect[3]-1 {
            if !paper[x][y] {
                paper[x][y] = true
            }
        }
    }
}

let dx: [Int] = [0,0,-1,1]
let dy: [Int] = [-1,1,0,0]
var count = 0
// dfs
func dfs(_ x: Int, _ y: Int) {
    for i in 0..<dx.count {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if nx < 0 || ny < 0 || nx > n-1 || ny > m-1 {
            continue
        } else {
            if !paper[ny][nx] {
                paper[ny][nx] = true
                count += 1
                dfs(nx,ny)
            }
        }
    }
}

for i in 0..<m {
    for j in 0..<n {
        if !paper[i][j] {
            paper[i][j] = true
            count += 1
            dfs(j,i)
            result.append(count)
            count = 0
        }
    }
}
result = result.sorted()
print(result.count)
print(result.map{ String($0) }.joined(separator: " "))