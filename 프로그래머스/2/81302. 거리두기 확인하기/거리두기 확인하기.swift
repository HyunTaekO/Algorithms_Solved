import Foundation

func solution(_ places:[[String]]) -> [Int] {
    var result: [Int] = []
    for place in places {
        result.append(check(place))
    }
    return result
}

func check(_ place: [String]) -> Int {
    let map = place.map{ $0.map{ String($0) }}
    let dx = [0, 0, -1, 1, -1, -1, 1, 1]
    let dy = [1, -1, 0, 0, -1, 1, -1, 1]
    let dx2 = [0, 0, 2, -2]
    let dy2 = [2, -2, 0, 0]
    for x in 0..<map.count {
        for y in 0..<map[0].count {
            if map[x][y] == "P" {
                for i in 0..<8 {
                    let nx = x + dx[i]
                    let ny = y + dy[i]
                    
                    guard 0..<map.count ~= nx && 0..<map[0].count ~= ny else{ continue }
                    
                    if map[nx][ny] == "P" { 
                        if map[x][ny] == "X" && map[nx][y] == "X" {
                            continue
                        }else {
                            return 0
                        }
                    }
                    
                }
                for i in 0..<4 {
                    let nx = x + dx2[i]
                    let ny = y + dy2[i]
                    
                    guard 0..<map.count ~= nx && 0..<map[0].count ~= ny else{ continue }
                    
                    if map[nx][ny] == "P" { 
                        if dx2[i] == 2 {
                            if map[nx-1][y] != "X" { return 0 }
                        }else if dx2[i] == -2{
                            if map[nx+1][y] != "X" { return 0 }
                        }else if dy2[i] == 2 {
                            if map[x][ny-1] != "X" { return 0 }
                        }else if dy2[i] == -2 {
                            if map[x][ny+1] != "X" { return 0 }
                        }
                    }
                }
            }
        }
    }
    return 1
}