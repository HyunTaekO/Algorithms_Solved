import Foundation
func round(_ a: Double,_ b: Double) -> Int{
    var aIndex = round(a / 2)
    var bIndex = round(b / 2)
    var cnt = 1
    while aIndex != bIndex {
        cnt += 1
        aIndex = round(aIndex / 2)
        bIndex = round(bIndex / 2)
    }
    return cnt
}
func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{

    return round(Double(a), Double(b))
}