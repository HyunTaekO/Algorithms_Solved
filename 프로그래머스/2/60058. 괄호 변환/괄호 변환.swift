import Foundation

func solution(_ p:String) -> String {
    return check(p) ? p : trans(p)
}

func trans(_ str: String) -> String {
    guard !check(str) else{ return str }
    let (u, v) = slice(str)
    if check(u) {
        return u + trans(v)
    }else {
        return "(" + trans(v) + ")" + delReverse(u)
    }
}
func delReverse(_ str: String) -> String {
    guard !str.isEmpty else{ return "" }
    var result = str.map{ String($0) }
    result = Array(result[1..<str.count-1])
    return result.map{ $0 == "(" ? ")" : "(" }.joined()
}
func slice(_ str: String) -> (String, String) {
    var l = 0
    var r = 0
    var u = ""
    for c in str {
        u += String(c)
        if c == "(" {
            l += 1 
        }else {
            r += 1
        }
        if l == r { break }
    }
    
    let v = str.count - u.count == 0 ? "" : String(str.suffix(str.count - u.count))
    return (u, v)
}
func check(_ str: String) -> Bool {
    var l = 0
    var r = 0
    for c in str {
        if c == "(" {
            l += 1
        }else {
            r += 1
            if r > l { return false }
        }
    }
    return true
}