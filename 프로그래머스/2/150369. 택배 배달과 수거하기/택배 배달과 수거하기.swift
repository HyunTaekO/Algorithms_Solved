import Foundation
// 11:10 ~ 
//100,000 * 50
func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var result = 0
    var del = deliveries
    var pick = pickups
    del.removeZero()
    pick.removeZero()
    while !del.isEmpty || !pick.isEmpty {
        result += max(del.count, pick.count) * 2
        var temp = cap
        
        while !del.isEmpty {
            if del.last! > temp {
                del[del.count-1] -= temp
                break
            }else {
                temp -= del[del.count-1]
                del.removeLast()
            }
        }
        
        temp = cap
        
        while !pick.isEmpty {
            if pick.last! > temp {
                pick[pick.count-1] -= temp
                break
            }else {
                temp -= pick[pick.count-1]
                pick.removeLast()
            }
        }
        
    }
    return Int64(result)
}

extension Array where Element == Int {
    mutating func removeZero() {
        while self.last ?? 1 == 0 {
            self.removeLast()
        }
    }
}