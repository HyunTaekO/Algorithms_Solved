import Foundation

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    var result = 0
    var setX: Set<Int> = [x]
    while !setX.isEmpty {
        if setX.contains(y) { return result }
        var nextSet: Set<Int> = []
        for s in setX {
            if s + n <= y {
                nextSet.insert(s+n)
            }
            if s * 2 <= y {
                nextSet.insert(s*2)
            }
            if s * 3 <= y {
                nextSet.insert(s*3)
            }
        }
        setX = nextSet
        result += 1
    }
    return -1
}
