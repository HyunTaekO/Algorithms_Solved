func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var board = board.map{ $0.map{ String($0) }}
    var result = 0
    while true {
        let n = remove(board)
        if n.1 == 0 { return result }
        board = n.0
        result += n.1
        board = down(board)
    }

    return result
}

func remove(_ board: [[String]]) -> ([[String]], Int) { // 2*2 블럭 지우기
    var newBoard = board
    var cnt = 0
    let dx = [0, 0, 1, 1]
    let dy = [0, 1, 0, 1]
    
    for x in 0..<board.count {
        for y in 0..<board[0].count {
            var check = false
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                guard nx < board.count && ny < board[0].count && "A" <= board[x][y] && board[x][y] <= "Z" else { check = false; break }
                if board[x][y] == board[nx][ny] {
                    check = true
                    continue
                }else {
                    check = false
                    break
                }
            }
            if check {
                for i in 0..<4 {
                    let nx = x + dx[i]
                    let ny = y + dy[i]
                    guard nx < board.count && ny < board[0].count && newBoard[nx][ny] != "0" else { continue }
                    newBoard[nx][ny] = "0"
                    cnt += 1
                }
            }
        }
    }
    return (newBoard, cnt) //지운 보드, 지운블럭 개수
}

func down(_ board: [[String]]) -> [[String]] { //블럭 내리기
    var newBoard = board
    for x in stride(from: board.count-1, through: 0, by: -1) {
        for y in 0..<board[0].count {
            guard x - 1 >= 0 else { continue }
            var nx = x - 1
            while true {
                if newBoard[x][y] == "0" {
                    newBoard[x][y] = newBoard[nx][y]
                    newBoard[nx][y] = "0"
                    guard nx - 1 >= 0 else { break }
                    nx -= 1
                    continue
                }else {
                    break
                }
            }
        }
    }
    return newBoard
}
