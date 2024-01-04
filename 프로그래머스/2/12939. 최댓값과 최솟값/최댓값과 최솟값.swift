func solution(_ s:String) -> String {
    let arr = s.split{$0 == " "}.map{Int(String($0))!}
    return "\(arr.min()!) \(arr.max()!)"
}