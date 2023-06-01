import Foundation

func solution(_ s:String) -> Int {
    var x = ""
    var cntx = 0
    var cnto = 0
    var result = 0
    for c in 0..<s.count {
        let i = String(s[c])
        guard c != s.count - 1 else { return result + 1}
        
        if x == "" { //x가 빈문자열이면 i 대입하고 cntx(x개수) + 1
            x = i
            cntx += 1
            print(i, cntx)
        }else if i == x {
            cntx += 1
        }else {
            cnto += 1
        }
        
        if cntx == cnto {
            result += 1
            print(result)
            x = ""
            cntx = 0
            cnto = 0
        }
        
    }
    return result
}
extension String {
    subscript(index: Int) -> Character {
        return self[String.Index(encodedOffset: index)]
    }
}