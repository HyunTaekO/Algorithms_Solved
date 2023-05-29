func solution(_ n:Int64) -> Int64 {
    for i in 1...n {
        if i * i == n {
            return (i + 1) * (i + 1)
        }else if i * i > n {
            return -1
        }else {
            continue
        }
    }
    return -1
}