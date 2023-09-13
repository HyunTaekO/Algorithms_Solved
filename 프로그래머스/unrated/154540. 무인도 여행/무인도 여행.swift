import Foundation

func solution(_ maps:[String]) -> [Int] {
    var result = [Int]() // 각 섬에서 머무를 수 있는 최대 일 수 
    let row = maps.count
    let col = maps[0].count
    let maps = maps.map{ $0.map{ String($0) }}
    var visited = Array(repeating: Array(repeating: false, count: col), count: row)
    let dx = [0, 0, -1, 1]
    let dy = [1, -1, 0, 0]
    
    func bfs(x: Int, y: Int) -> Int {
        visited[x][y] = true
        guard maps[x][y] != "X" else{ return 0 }
        var queue = [(x, y)]
        var sum = 0
        var idx = 0 
        while idx < queue.count {
            let (qx, qy) = queue[idx]
            if maps[qx][qy] != "X" {
                sum += Int(maps[qx][qy])!
            }
            
            for i in 0..<4 {
                let nx = qx + dx[i]
                let ny = qy + dy[i]
                guard 0..<row ~= nx && 
                0..<col ~= ny && 
                !visited[nx][ny] && 
                maps[nx][ny] != "X" else { continue }
                
                visited[nx][ny] = true
                queue.append((nx, ny))
            }
            idx += 1
        }
        return sum
    }
    
    func dfs(x: Int, y: Int) -> Int {
        if maps[x][y] == "X" { return 0 }
        var sum: Int = Int(maps[x][y])!
        visited[x][y] = true
    
        for i in dx.indices {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if nx >= row || nx < 0 || ny >= col || ny < 0 { continue }
            if visited[nx][ny] { continue }
            visited[nx][ny] = true
            sum += dfs(x: nx, y: ny)
        }
        return sum
    }   
    
    for x in 0..<row {
        for y in 0..<col {
            if !visited[x][y] {
                let sum = dfs(x: x, y: y)
                if sum > 0 {
                    result.append(sum)
                }
            }
        }
    }
    return result.isEmpty ? [-1] : result.sorted()
}

