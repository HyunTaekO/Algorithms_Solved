import Foundation

func solution(_ keyinput:[String], _ board:[Int]) -> [Int] {
    var result = [0, 0]
    let scope = [board[0] / 2, board[1] / 2]
    for key in keyinput {
        var x = result[0]
        var y = result[1]
        
        switch key {
            case "up":
                y += 1
            case "down":
                y -= 1
            case "left":
                x -= 1 
            case "right":
                x += 1
            default:
                continue
        }
        guard scope[0] >= abs(x) && abs(y) <= scope[1] else{
            continue
        }
        result = [x, y]
    }
    
    return result
}