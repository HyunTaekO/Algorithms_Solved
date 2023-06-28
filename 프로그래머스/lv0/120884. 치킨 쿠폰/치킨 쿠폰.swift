import Foundation

func solution(_ chicken:Int) -> Int {
    var cup = chicken
    var service = 0
    while cup >= 10 {
        let s = cup / 10
        service += s
        cup = cup % 10
        cup += s
    }
    return service
}