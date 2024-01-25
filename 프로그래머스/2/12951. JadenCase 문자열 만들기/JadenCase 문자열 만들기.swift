func solution(_ s:String) -> String {
    let s = s.map{String($0)}
    var result = ""
    result += Character(s[0]).isNumber ? s[0] : s[0].uppercased()
    for l in 1..<s.count {
        if Character(s[l]).isLetter {
            if Character(s[l-1]) == " " {
                result += s[l].uppercased()
            }else {
                result += s[l].lowercased()
            }
        }else {
            result += s[l]
        }
    }
    return result
}