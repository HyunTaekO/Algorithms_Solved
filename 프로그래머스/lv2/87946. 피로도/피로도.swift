import Foundation

func combi(_ n: Int) -> [[Int]] {
    var result: [[Int]] = []
    
    func combination(_ arr: [Int]) {
        if arr.count == n {
            result.append(arr)
            return
        } else {
            for i in 0..<n {
                if !arr.contains(i) {
                    combination(arr + [i])    
                }
            }
        }
    }
    
    combination([])
    
    return result
}

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    
    let combination = combi(dungeons.count)
    // print("combination: \(combination)")
    
    var result = 0
    combination.forEach {
        var k = k, count = 0
        
        for index in $0 {
            guard k >= dungeons[index][0] else { break }
            
            k -= dungeons[index][1] 
            count += 1
        }
        
        result = max(result, count)
    }
    
    return result
}