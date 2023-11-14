import Foundation

let nm = readLine()!.split{ $0 == " "}.map{ Int(String($0))! }
var map = Array(repeating: Array<Bool>(), count: nm[0])
var distances = Array(repeating: Array(repeating: 0, count: nm[1]), count: nm[0])
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

for i in 0..<nm[0] {
    map[i] = readLine()!.map{ $0 == "0" ? false : true }
}

func bfs(_ map: [[Bool]]) {
    var visited = Array(repeating: Array(repeating: false, count: nm[1]), count: nm[0])
    
    distances[0][0] = 1
    visited[0][0] = true
    
    var queue = [(0, 0)]
    var idx = 0
    
    while idx < queue.count {
        let dequeued = queue[idx]
        let (x, y) = (dequeued.0, dequeued.1)
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            guard 0..<nm[0] ~= nx && 0..<nm[1] ~= ny 
                    && !visited[nx][ny]
                    && map[nx][ny] else{ continue }
            
            distances[nx][ny] = distances[x][y] + 1
            
            visited[nx][ny] = true
            queue.append((nx, ny))
            
        }
        
        idx += 1
    }
}

bfs(map)
print(distances[nm[0]-1][nm[1]-1])
