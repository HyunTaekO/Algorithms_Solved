func solution(_ n:Int64) -> [Int] {
    let str = String(n)
    
    return Array(str).map { String($0) }.reversed().map { Int($0)! }
}