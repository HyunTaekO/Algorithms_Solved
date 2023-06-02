import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var result = 0
    var n = board[0].count - 1
    var counts: [Int] = Array(repeating: 0, count: n + 1)
    var pick: [Int] = []
    for i in 0...n {
        for j in 0...n {
            if board[i][j] == 0 {
                continue
            }else {
                counts[j] += 1
                
            }
        }
    }
    
    for i in moves {
        if counts[i-1] == 0 {
            continue
        }
        if let p = pick.last {
            if p == board[n-counts[i-1]+1][i-1] {
                result += 2
                counts[i-1] -= 1
                pick.removeLast()
            }else {
                pick.append(board[n-counts[i-1]+1][i-1])
                counts[i-1] -= 1
            }
        }else { // n: 4 counts[i-1]: -4 , 0
            pick.append(board[n-counts[i-1]+1][i-1])
            counts[i-1] -= 1
        }
        
    }
    return result
}