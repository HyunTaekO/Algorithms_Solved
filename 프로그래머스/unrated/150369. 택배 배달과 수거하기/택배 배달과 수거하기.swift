import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var del = deliveries
    var pick = pickups
    var result = 0

    while !del.isEmpty || !pick.isEmpty {
        while true{
            guard !del.isEmpty && !pick.isEmpty else{ break }
            if let dL = del.last {
                if dL == 0 {
                    del.removeLast()
                }else {
                    break
                }
            }
            if let dP = pick.last {
                if dP == 0 {
                    pick.removeLast()
                }else {
                    break
                }
            }
        }

        result += max(del.count, pick.count) * 2
        var c = cap
        while !del.isEmpty { 
            if del.last! > c {
                del[del.count - 1] -= c
                break
            } else {
                c -= del[del.count - 1]
                del.removeLast()
            }
        }
        
        c = cap
        while !pick.isEmpty {
            if pick.last! > c {
                pick[pick.count - 1] -= c
                break
            }else {
                c -= pick[pick.count - 1]
                pick.removeLast()
            }
        }
        
    }
    return Int64(result)
}
