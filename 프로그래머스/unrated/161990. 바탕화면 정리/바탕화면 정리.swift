import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    let wall = wallpaper.map{ $0.map{ String($0)}}
    var result = [-1, -1, -1, -1]
    var check = false
    for i in 0..<wallpaper.count {
        //왼쪽 위 좌표
        if wall[i].contains("#") && check == false {
            result[0] = i
            check = true
        }
        if let lef = wall[i].firstIndex(of: "#") {
            if result[1] == -1 {
                result[1] = lef
            }else if lef < result[1] {
                result[1] = lef
            }
        }
        
        //오른쪽 아래 좌표
        if wall[i].contains("#") {
            result[2] = i + 1
        }
        if let ri = wall[i].lastIndex(of: "#") {
            if ri >= result[3] {
                result[3] = ri + 1
            }
        }
        
    }
    return result
}