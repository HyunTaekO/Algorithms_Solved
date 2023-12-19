import Foundation

func solution(_ sticker:[Int]) -> Int{
    guard sticker.count > 2 else{ return sticker.max()! }
    var dp1 = Array(repeating: 0, count: sticker.count)
    dp1[0] = sticker[0]
    dp1[1] = max(dp1[0], sticker[1])
    for i in 2..<sticker.count-1 {
        dp1[i] = max(dp1[i-1], dp1[i-2] + sticker[i])
    }
    
    var dp2 = Array(repeating: 0, count: sticker.count)
    dp2[0] = 0
    dp2[1] = sticker[1]
    for i in 2..<sticker.count {
        dp2[i] = max(dp2[i-1], dp2[i-2] + sticker[i])
    }
    let fm = dp1.max()!
    let lm = dp2.max()!
    return fm < lm ? lm : fm
}