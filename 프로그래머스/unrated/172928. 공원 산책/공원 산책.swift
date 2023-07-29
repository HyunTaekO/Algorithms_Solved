import Foundation

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    var map: [[String]] = park.map{ $0.map{ String($0) } }
    var start = (0, 0)
    let route = routes.map{ ($0.prefix(1), Int($0.suffix(1))!)}
    for i in 0..<map.count {
        for j in 0..<map[i].count {
            if map[i][j] == "S" {
                start = (i, j)
                break
            }
        }
    }
    route.forEach{ move in
        let direct = move.0
        let cnt = move.1
        let dx = start.0
        let dy = start.1
        var nx = dx
        var ny = dy
        for _ in 0..<cnt {
            switch direct {
                case "E":
                    ny += 1
                case "W":
                    ny -= 1
                case "S":
                    nx += 1
                case "N":
                    nx -= 1
                default: 
                    break
            }
            
            guard nx >= 0 && nx < map.count && ny >= 0 && ny < map[0].count && map[nx][ny] != "X" else{
                start = (dx, dy); break }
            start = (nx, ny)
        }
    }
    return [start.0, start.1]
}