import Foundation

func solution(_ n:Int) -> [Int] {
    enum Direction {
        case down, right, up
    }
    var arr = [[Int]]()
    var direction: Direction = .down // 방향 변수
    var cnt = 1 // 저장된 숫자 개수 카운트용
    var line = n - 1 == 0 ? 1 : n - 1 // 한줄에 저장될 숫자 개수
    var sum = 0 // 총 저장될 숫자 개수
    var value = 0
    for i in 1...n {
        let appendArr = Array(repeating: 0, count: i)
        arr.append(appendArr)
        sum += i
    }
    
    while cnt <= sum {
        switch direction {
            case .down:
                for i in 0..<line {
                    arr[i + (value * 2)][value] = cnt
                    cnt += 1
                }
                direction = .right
            
            case .right:
                for i in 0..<line {
                        arr[n - 1 - value][i + value] = cnt
                        cnt += 1
                    }
                direction = .up
            
            case .up:
                for i in value..<line+value {
                        arr[n - 1 - i][n - 1 - i - value] = cnt
                        cnt += 1
                    }
                direction = .down
                value += 1
                line = line - 3 == 0 ? 1 : line - 3
        }
    }
    return arr.flatMap({ $0 })
}