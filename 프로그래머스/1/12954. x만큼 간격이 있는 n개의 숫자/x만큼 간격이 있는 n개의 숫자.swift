func solution(_ x:Int, _ n:Int) -> [Int64] {
    var result = Array(repeating: 0, count: n)
    var t = 0
    result = result.map{ num in 
                        t += 1
                        return (t * x)  
                       }
    return result.map{Int64($0)}
}