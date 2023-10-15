import Foundation
// 1. 새로시작하는 과제는 무조건 인터셉트, 끝낸 후 이어서 계속 진행 
// 2. 멈춰둔 과제 여러개면 가장 최근꺼부터 시작
// 1) 시간 => 분으로 매핑
// 2) 시간 역순으로 정렬
// 3) 과제 끝낸 배열 생성, 대기중 스택 생성
// 4) plans popLast()로 다음 과제시간까지 끝내지 못하면 대기중 스택에 넣기
// (10, 20) -> (10) (20, 20) -> (15) (25, 10)
struct Work {
    var name: String
    var start: Int
    var playtime: Int
}
func solution(_ plans:[[String]]) -> [String] {
    var result = [String]()
    var stack = [Work]() 
    var arr = plans.map{ Work(name: $0[0], start: (Int($0[1].prefix(2))!) * 60 + Int($0[1].suffix(2))!, playtime: Int($0[2])!) } // plans => [Work]로 매핑
    arr = arr.sorted(by: { $0.start > $1.start } ) // 시작 시간순 정렬
    var current = arr.popLast()! // 처음 시작 원소 pop
    
    while !arr.isEmpty { 
        let elem = arr.popLast()! // 다음 시작 원소 pop
        
        if current.start + current.playtime > elem.start { // 완수하지 못하고 시간이 남는 경우
            current.playtime = current.start + current.playtime - elem.start
            stack.append(current)
            current = elem
        }else if current.start + current.playtime == elem.start { // 완수하고, 바로 다음 시작하는 경우
            result.append(current.name)
            current = elem
        }else { // 완수하고 시간이 남는 경우
            result.append(current.name)
            if stack.isEmpty { //시간이 남는데 더 진행할 작업이 없을때
                current = elem 
            }else {
                var time = elem.start - (current.start + current.playtime)
                current = elem
                while !stack.isEmpty {
                    if let last = stack.last { // 스택 마지막 원소가 있으면 last
                        if last.playtime <= time { // last가 완료될 수 있으면
                            result.append(last.name)
                            time -= last.playtime
                            stack.removeLast()
                            continue
                        }else { // 완료되지 못하면
                            stack[stack.count-1].playtime = last.playtime - time
                            break
                        }
                    }

                }
            }
            
        }
        if arr.isEmpty {
            result.append(elem.name)
            break
        }
    }
    
    if !stack.isEmpty {
        for s in stack.reversed() {
            result.append(s.name)
        }
    }
    return result
}