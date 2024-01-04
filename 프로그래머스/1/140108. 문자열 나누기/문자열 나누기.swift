import Foundation

func solution(_ s:String) -> Int {
    let str = s.map{$0}
    var x = str[0]
    var (xc, oc) = (0, 0)
    var result = 0
    func sp(_ i: Int) {
        guard i < str.count else{ return }
        var cur = i
        x = str[i]
        while cur < str.count {
            if x == str[cur] {
                xc += 1
            }else {
                oc += 1
            }
            if xc == oc {
                result += 1
                xc = 0
                oc = 0
                sp(cur+1)
                return
            }else {
                cur += 1
            }
        }
        result += 1
        return 
    }
    sp(0)
    return result
}