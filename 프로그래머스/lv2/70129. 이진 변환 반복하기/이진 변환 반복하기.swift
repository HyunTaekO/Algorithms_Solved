import Foundation

func solution(_ s:String) -> [Int] {
    var str = s
    var cnt = 0
    var removeCnt = 0
    while str != "1" {
        cnt += 1
        removeCnt += str.filter{ $0 == "0"}.count
        let newC = str.filter{ $0 != "0" }.count
        str = String(newC, radix: 2)
    }
    
    return [cnt, removeCnt]
}