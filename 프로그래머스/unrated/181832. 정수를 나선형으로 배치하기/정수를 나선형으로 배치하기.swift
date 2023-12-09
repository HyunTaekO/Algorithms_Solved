import Foundation
enum Direct {
    case up, down, left, right
    
    var next: Direct {
        switch self {
            case .right:
            return .down
            case .down:
            return .left
            case .left:
            return .up
            case .up:
            return .right
        }
    }
    
    func move(_ x: Int,_ y: Int) -> (Int, Int) {
        switch self {
            case .right:
            return (x, y+1)
            case .down:
            return (x+1, y)
            case .left:
            return (x, y-1)
            case .up:
            return (x-1, y)
        }
    }
    
}
func solution(_ n:Int) -> [[Int]] {
    var result = Array(repeating: Array(repeating: 0, count: n), count: n)
    var num = 1
    var direct: Direct = .right
    var (x, y) = (0, 0)
    
    func fill() {
        guard num <= n*n else{ return }
        result[x][y] = num
        num += 1
        let (nx, ny) = direct.move(x, y)
        guard 0..<n ~= nx && 0..<n ~= ny else{ 
            direct = direct.next
            (x, y) = direct.move(x, y)
            fill()
            return
        }
        guard result[nx][ny] == 0 else{
            direct = direct.next
            (x, y) = direct.move(x, y)
            fill()
            return
        }
        x = nx
        y = ny
        fill()
        return
    }
    fill()
    return result
}