import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var cur = n
    var result = 0
    while cur >= a {
        let bot = cur / a
        cur = (cur - (bot * a)) + (bot * b)
        result += (bot * b)
    }
    return result
}