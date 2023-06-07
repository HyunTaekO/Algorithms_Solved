import Foundation
func c2(_ next: Int,_ n: String) -> Int {
    var nextCnt = next
    
    while n.filter{ $0 == "1" }.count != String(nextCnt, radix: 2).filter{ $0 == "1" }.count {
        nextCnt += 1
    }
    return nextCnt
}
func solution(_ n:Int) -> Int
{
    var next = n + 1
    
    return c2(next, String(n, radix: 2))
}
