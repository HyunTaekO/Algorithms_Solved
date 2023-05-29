func solution(_ x:Int) -> Bool {
    var nums = String(x).map { String($0) }
    
    let sum = nums.map { Int($0)! }.reduce(0, +)
    
    return x % sum == 0
}