import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var allStage = Array(1...N) // 전체 스테이지 번호
    var complete: [(Double, Double)] = Array(repeating: (0, 0), count: N + 2) //(도달했으나 클리어x, 도달한 플레이어수) 배열
    let stages = stages.sorted()
    var index = 0
    for i in 1..<stages.count {
        if i == stages.count-1 {
            complete[stages[i-1]] = (Double(i), 0)
        }
        if stages[i] == stages[i-1] {
            continue
        }else {
            complete[stages[i-1]] = (Double(i - index), Double(stages.count - index))
            index = i
            continue
        }
        
    }
    let com = complete.map{ stage -> Double in
                                if stage.0 == 0.0 {
                                    return 0.0
                                }else if stage.1 == 0.0 {
                                    return 1.0
                                }else {
                                    return stage.0 / stage.1
                                }
                           }
    allStage = allStage.sorted(by: { com[$0] > com[$1] } )
    return allStage
}
