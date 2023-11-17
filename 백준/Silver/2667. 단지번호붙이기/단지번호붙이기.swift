import Foundation

let n = Int(readLine()!)!

var map = Array(repeating: Array<Int>(), count: n)
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var houseCounts: [Int] = []
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

for i in 0..<n {
    map[i] = readLine()!.map{ Int(String($0))! }
}

func solve() {
    for x in 0..<n {
        for y in 0..<n {
            if !visited[x][y] && map[x][y] == 1 {
                visited[x][y] = true
                houseCounts.append(bfs(x, y))
            }
        }
    }
}
func bfs(_ x: Int,_ y: Int) -> Int {
    var queue = [(x, y)]
    var idx = 0
    var cnt = 1
    while idx < queue.count {
        let (x, y) = queue[idx]
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            guard 0..<n ~= nx && 0..<n ~= ny else{ continue }
            
            if !visited[nx][ny] {
                visited[nx][ny] = true
                if map[nx][ny] == 1 {
                    queue.append((nx, ny))
                    cnt += 1
                }
            }
        }
        
        
        idx += 1
    }
    return cnt
}

let _ = solve()
print(houseCounts.count)
houseCounts.sort(by: <)
houseCounts.forEach{ print($0) }
