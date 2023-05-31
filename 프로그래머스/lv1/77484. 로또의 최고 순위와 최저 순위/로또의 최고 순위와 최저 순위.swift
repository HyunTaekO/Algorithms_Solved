import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let rank = [6: 1, 5: 2, 4: 3, 3: 4, 2: 5, 1: 6, 0: 6]
    var result = [0, 0]
    var winArr = win_nums.sorted(by: >)
    let myArr = lottos.sorted(by: >)
    
    for i in 0..<myArr.count {
        if winArr.contains(myArr[i]) {
            result[1] += 1
            winArr.remove(at: winArr.firstIndex(of: myArr[i])!)
        }
    }
    let zeroCnt = myArr.filter { $0 == 0 }.count
    
    result[0] = rank[result[1] + zeroCnt]!
    result[1] = rank[result[1]]!
    
    return result

}