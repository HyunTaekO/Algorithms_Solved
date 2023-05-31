func solution(_ n:Int) -> Int {
    var arr = [false, false] + Array(repeating: true, count: n-1)
    
    for i in 2...n {
        if arr[i] { 
            for j in stride(from: i*2, to: n+1, by: i) {
                arr[j] = false
            }
        }
    }
    
    return arr[2...n].filter { $0 }.count
}