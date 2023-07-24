import Foundation

let tc = Int(readLine()!)!

for _ in 0..<tc {
    var dic = [Int: [Int]]() // 각 팀이 얻는 점수들
    var set1: Set<Int> = [] // 팀의 종류
    let n = Int(readLine()!)!
    var arr = readLine()!.components(separatedBy:" ").map{Int($0)!}
    set1 = Set(arr)
    for x in set1 {
        let cnt = arr.filter{$0 == x}.count
        if cnt < 6 { // 선수가 6명 아래면 제외
            arr = arr.filter{$0 != x}
        }
    }
    var value = 1 // 점수
    for x in arr {
        if dic[x] == nil {
            dic[x] = [value]
        } else { 
            dic[x]!.append(value)
        }
        value += 1
    }
    var reduceArr = dic.map{ a in 
        return (a.key, (0...3).map{ a.value[$0] }.reduce(0, +)) //가장 상위의 4명의 점수를 누적
    }
    var minVal = 1001
    for x in reduceArr {
        if x.1 < minVal { // 제일 낮은 점수를 가진 팀의 점수
            minVal = x.1
        }
    }
    var fillArr = reduceArr.filter{$0.1 == minVal}
    if fillArr.count > 1 { // 제일 낮은 점수를 가진 팀이 여러 팀이라면
        var min = 1001
        var result = 0
        for x in fillArr {
            if min > dic[x.0]![4] { //다섯번째의 선수를 비교한다.
                min = dic[x.0]![4]
                result = x.0
            }
        }
        print(result)    
    } else {
        print(fillArr[0].0) // 제일 낮은 점수를 가진 팀이 하나라면 그 팀을 출력
    }
}