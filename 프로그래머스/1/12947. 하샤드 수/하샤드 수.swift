func solution(_ x:Int) -> Bool {
    var sum = String(x).map{Int(String($0))!}.reduce(0, +)
    return x % sum == 0 ? true : false
}