import Foundation
// 12:25 ~ 13:07 

// 출발지점부터 탈출 지점까지 이동하는 경로들을 구하면서 거리가 k인 경로 탐색
// 

func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ r:Int, _ c:Int, _ k:Int) -> String {
    var paths: String = ""
    let dx = [1, 0, 0, -1]
    let dy = [0, -1, 1, 0]
    let minDist = abs(r - x) + abs(c - y)
    if k < minDist || (k - minDist) % 2 == 1 {
        return "impossible"
    }
    func findPath(_ start: (Int, Int),_ path: String) {
        let (cx, cy) = (start.0, start.1)
        
        if k < path.count + abs(cx - r) + abs(cy - c) || !paths.isEmpty {
            return
        }
        
        if path.count == k && cx == r && cy == c {
            paths = path
            return
        }
        
        for i in 0..<4 {
            let nx = cx + dx[i]
            let ny = cy + dy[i]
            guard 1..<n+1 ~= nx && 1..<m+1 ~= ny else{ continue }
            findPath((nx, ny), path + ntos(i))
        }
    }
    
    findPath((x, y), "")
    
    return paths
}

func ntos(_ n: Int) -> String {
    var result = ""
    switch n {
        case 0:
        result = "d"
        case 1:
        result = "l"
        case 2:
        result = "r"
        default:
        result = "u"
    }
    return result
}