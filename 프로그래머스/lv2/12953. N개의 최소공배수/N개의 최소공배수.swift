func solution(_ arr:[Int]) -> Int {
    var a = arr[0]
    var b = 0
    
    for i in 1..<arr.count {
        b = arr[i]
        a = lcm(a, b)
    }
    return a
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}
func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    } else {
        return gcd(b, a % b)
    }
}