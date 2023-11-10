import Foundation

func solution(_ board:[[Int]]) -> Int {
    return dangerous(board).flatMap{ $0 }.filter{ $0 == 0 }.count
}

func dangerous(_ board: [[Int]]) -> [[Int]] {
    var map = board
    let dx = [-1, 1, 0, 0, 1, 1, -1, -1]
    let dy = [0, 0, 1, -1, -1, 1, -1, 1]
    for x in 0..<board.count {
        for y in 0..<board[0].count {
            guard board[x][y] == 1 else{ continue }
            for i in 0..<8 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                guard 0..<board.count ~= nx && 0..<board[0].count ~= ny else{ continue }
                
                map[nx][ny] = 1
                
            }
            
        }
    }
    return map
}