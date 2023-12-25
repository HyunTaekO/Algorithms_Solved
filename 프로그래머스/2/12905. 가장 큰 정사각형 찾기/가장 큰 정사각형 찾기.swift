import Foundation

func solution(_ board:[[Int]]) -> Int
{   
    var newB = board
    
    if board.count == 1 || board[0].count == 1 {
        return board.flatMap{$0}.max()!
    }
    
    for r in 1..<board.count {
        for c in 1..<board[0].count {
            if board[r][c] == 1 {
                newB[r][c] += min(newB[r-1][c], newB[r-1][c-1], newB[r][c-1])
            }
        }
    }
    let width = newB.flatMap{$0}.max()!
    return  width * width
}