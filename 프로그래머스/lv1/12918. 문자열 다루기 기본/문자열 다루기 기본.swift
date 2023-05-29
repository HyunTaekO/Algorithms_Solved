func solution(_ s:String) -> Bool {
    guard s.count == 4 || s.count == 6 else { return false }
    if let i = Int(s) {
        return true
    }
    return false
}