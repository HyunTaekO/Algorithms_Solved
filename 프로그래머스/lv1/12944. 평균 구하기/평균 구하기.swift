func solution(_ arr:[Int]) -> Double {
    var sum = 0
    guard arr.count >= 1 && arr.count <= 100 else{return -1.1}
    for i in arr{
        sum += i
    }
    return Double(sum)/Double(arr.count)
}