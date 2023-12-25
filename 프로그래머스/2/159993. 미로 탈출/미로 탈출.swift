import Foundation
// var s = (-1, -1)
// var l = (-1, -1)
// func solution(_ maps:[String]) -> Int {
//     let arr = maps.map{$0.map{$0}}
    
//     for r in 0..<arr.count {
//         for c in 0..<arr[0].count {
//             if arr[r][c] == "S" {
//                 s = (r, c)
//             }
//             if arr[r][c] == "L" {
//                 l = (r, c)
//             }
//         }
//         if s != (-1, -1) && l != (-1, -1) { break }
//     }
//     let findLever =  move(arr, "L", s)
//     let findEnd =  move(arr, "E", l)
//     return findLever == -1 || findEnd == -1 ? -1 : (findLever + findEnd)
// }

// func move(_ arr: [[Character]],_ find: Character,_ start: (Int, Int)) -> Int {
//     let dx = [-1, 1, 0, 0]
//     let dy = [0, 0, -1, 1]
//     var result = Int.max
//     var visited = Array(repeating: Array(repeating: false, count: arr[0].count), count: arr.count)
//     visited[start.0][start.1] = true
//     func moving(_ time: Int,_ current: (Int, Int)) {
//         for i in 0..<4 {
//             let nx = current.0 + dx[i]
//             let ny = current.1 + dy[i]
            
//             guard 0..<arr.count ~= nx && 0..<arr[0].count ~= ny && arr[nx][ny] != "X" && !visited[nx][ny] else{ continue }
            
//             if arr[nx][ny] == find {
//                 result = min(result, time + 1)
//                 return
//             }
//             visited[nx][ny] = true
//             moving(time + 1, (nx, ny))
//             visited[nx][ny] = false
//         }
//     }
//     moving(0, start)
//     return result == Int.max ? -1 : result
// }

func solution(_ maps:[String]) -> Int {
    let direction = [[-1, 0], [1, 0], [0, 1], [0, -1]]
    let newMaps = maps.map { $0.map { String($0) }}
    let (n, m) = (newMaps.count, newMaps[0].count)
    var visits = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    var queue = [(Int, Int, Int)]()
    
    var saveQ = (0, 0, -1)
    
    func bfs(point: (Int, Int), searchText: String, move: Int) {
        if newMaps[point.0][point.1] == searchText {
            queue.removeAll()
            saveQ = (point.0, point.1, move)
            return
        }
        for dir in direction {
            let x = point.0 + dir[0]
            let y = point.1 + dir[1]
            
            if x >= 0 && y >= 0 && x < n && y < m {
                if newMaps[x][y] != "X" && !visits[x][y] {
                    visits[x][y] = true
                    queue.append((x, y, move+1))
                }
            }
        }
    }
    
    
    for i in 0..<n {
        for j in 0..<m {
            if newMaps[i][j] == "S" {
                queue.append((i, j, 0))
                visits[i][j] = true
                break
            }
        }
    }
    
    while !queue.isEmpty {
        if let q = queue.first {
            queue.removeFirst()
            bfs(point: (q.0, q.1), searchText: "L", move: q.2)
        }
    }
    
    if saveQ.2 == -1 {
        return -1
    }
    
    visits = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    queue.append(saveQ)
    visits[saveQ.0][saveQ.1] = true
    saveQ = (0,0,-1)
    
    while !queue.isEmpty {
        if let q = queue.first {
            queue.removeFirst()
            bfs(point: (q.0, q.1), searchText: "E", move: q.2)
        }
    }
    
    return saveQ.2
}
