import Foundation

func solution(_ before:String, _ after:String) -> Int {
    var after = after
    for i in before {
        if after.contains(i) {
            after.remove(at: after.lastIndex(of: i)!)
            continue
        }else {
            return 0
        }
    }
    return 1
}