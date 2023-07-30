import Foundation

func solution(_ dirs:String) -> Int {
    var map = Array(repeating: Array(repeating: [false, false, false, false], count: 11), count: 11)
    var result = 0
    var current = (5, 5)
    for d in dirs {
        let dx = current.0
        let dy = current.1
        var nx = dx
        var ny = dy
        var dir = 0
        switch d {
            case "U":
                nx += 1
                dir = 0
            case "D":
                nx -= 1
                dir = 1
            case "R":
                ny += 1
                dir = 2
            case "L":
                ny -= 1
                dir = 3
            default: 
                break
        }
        
        guard nx >= 0 && nx < 11 && ny >= 0 && ny < 11 else { continue }
        var node = -1
        if dir == 0 {
            node = 1
        }else if dir == 1 {
            node = 0
        }else if dir == 2 {
            node = 3  
        }else if dir == 3 {
            node = 2 
        }
        if !map[nx][ny][dir] && !map[dx][dy][node] {
            map[dx][dy][node] = true
            map[nx][ny][dir] = true
            result += 1
        }
        current = (nx, ny)
    }
    return result
}