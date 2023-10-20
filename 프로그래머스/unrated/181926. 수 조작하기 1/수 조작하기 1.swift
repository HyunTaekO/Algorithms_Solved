import Foundation

func solution(_ n:Int, _ control:String) -> Int {
    var result = n
    for c in control {
        switch c {
            case "w":
                result += 1
            case "s":
                result -= 1
            case "d":
                result += 10
            case "a":
                result -= 10
            default:
                continue
        }
    }
    return result
}