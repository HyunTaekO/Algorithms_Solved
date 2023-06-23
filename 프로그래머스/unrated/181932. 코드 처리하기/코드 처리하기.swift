import Foundation

func solution(_ code:String) -> String {
    var mode = false
    let code = code.map{ String($0) }
    var ret = ""
    for idx in 0..<code.count {
        if mode == false {
            if code[idx] != "1" && idx % 2 == 0 {
                ret += code[idx]
            }else if code[idx] == "1" {
                mode = true
            }
        }else if mode {
            if code[idx] != "1" && idx % 2 != 0 {
                ret += code[idx]
            }else if code[idx] == "1" {
                mode = false
            }
        }
        
    }
    return ret.isEmpty ? "EMPTY" : ret
}