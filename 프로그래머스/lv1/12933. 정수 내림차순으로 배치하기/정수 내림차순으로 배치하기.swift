func solution(_ n:Int64) -> Int64 {
    var str = String(n).map { String($0) }
    
    return Int64(str.sorted(by: >).joined())!
}