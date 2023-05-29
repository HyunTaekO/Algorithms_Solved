func solution(_ x:Int, _ n:Int) -> [Int64] {
    guard -10000000 <= x && x <= 10000000 && n <= 1000 else {return [-1]}
    var list: [Int64] = []
    
    for i in 1...n {
        list.append(Int64(x * i))
    }
    return list
}