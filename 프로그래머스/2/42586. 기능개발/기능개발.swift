import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var rest: [Int] = []
    //var comp: [Int] = []
    var result: [Int] = [1]
    for i in 0..<progresses.count {
        let l = 100 - progresses[i]
        let c = l % speeds[i] == 0 ? (l / speeds[i]) : (l / speeds[i]) + 1
        rest.append(c)
    }
    //comp.append(rest[0])
    var day = rest[0]
    for i in 1..<rest.count {
        if day >= rest[i] {
            result[result.count-1] += 1
        }else {
            result.append(1)
            day = rest[i]
        }
        
    }
    return result
}