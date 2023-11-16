import Foundation

func solution(_ gems:[String]) -> [Int] {
    //let (start, end) = twoPointer(gems)
    return twoPointer(gems)
}

func twoPointer(_ gems: [String]) -> [Int] {
    let kind: Set<String> = Set(gems)
    let gemCount: Int = Set(gems).count
    if gemCount == 1 {
        return [1, 1]
    }
    var gemDict: [String: Int] = [:]
    var left = 0, right = 0, minDist = Int.max
    var result: [Int] = [0, 0]
    
    while left < gems.count && right < gems.count {
        guard let _ = gemDict[gems[left]] else {
            gemDict[gems[left]] = 0
            continue
        }
        
        if gemDict.count == gemCount {
            if right - left < minDist {
                minDist = right - left
                result = [left+1, right+1]
            }

            gemDict[gems[left]]! -= 1
            if gemDict[gems[left]] == 0 {
                gemDict[gems[left]] = nil
            }
            left += 1
        } else {
            if let _ = gemDict[gems[right]] {
                gemDict[gems[right]]! += 1
                right += 1
            } else {
                gemDict[gems[right]] = 0
            }
        }
        
    }
    return result
}