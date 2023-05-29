import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var maxH = 0
    var maxW = 0

    for i in 0..<sizes.count {
        maxW = max(maxW, sizes[i].max()!)
        maxH = max(maxH, sizes[i].min()!)
       
    }
    
    return maxW * maxH
}