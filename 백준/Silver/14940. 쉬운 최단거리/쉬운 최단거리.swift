import Foundation

let nm = readLine()!.split{$0 == " "}.map{ Int(String($0))! }
let (n, m) = (nm[0], nm[1])

var map = Array(repeating: Array<Int>(), count: n)
var resultMap = Array(repeating: Array(repeating: 0, count: m), count: n)
var endPoint = (0, 0)

for i in 0..<n {
    let input = readLine()!.split{$0 == " "}.map{ Int(String($0))! }
    map[i] = input
}

for x in 0..<n {
    for y in 0..<m {
        if map[x][y] == 2 {
            endPoint = (x, y)
            break
        }
    }
}

func bfs() {
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    visited[endPoint.0][endPoint.1] = true
    resultMap[endPoint.0][endPoint.1] = 0
    var queue = [endPoint]
    var idx = 0
    
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    while idx < queue.count {
        let current = queue[idx]
        let x = current.0
        let y = current.1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            guard 0..<n ~= nx && 0..<m ~= ny else{ continue }
            guard map[nx][ny] != 0 && !visited[nx][ny] else{ continue }
            
            resultMap[nx][ny] = resultMap[x][y] + 1
            queue.append((nx, ny))
            visited[nx][ny] = true
            
        }
        idx += 1
    }
    
    for x in 0..<n {
        for y in 0..<m {
            if !visited[x][y] && map[x][y] == 1 {
                resultMap[x][y] = -1
            }
        }
    }
}
bfs()
resultMap.forEach{ print($0.map{ String($0) }.joined(separator: " "))}
