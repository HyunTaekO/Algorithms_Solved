import Foundation
// 현재 층 + 누른 숫자 만큼 이동한다. 만약 현재 층 + 수 가 0 이하라면 이동안한다.


func solution(_ storey:Int) -> Int {
    var num = String(storey).reversed().map{Int(String($0))!}
    let cnt = num.count
    var result = 0
    for i in 0..<cnt {
        let n = num[i]
        if n < 5 {
            result += n
        }else {
            var idx = i + 1
            result += 10 - n
            if n == 5 {
                guard i + 1 < cnt else{ continue }
                if num[i+1] < 5 {
                    continue
                }
            }
            while idx <= cnt {
                if idx == cnt {
                    result += 1
                    break
                }
                if num[idx] + 1 == 10 {
                    num[idx] = 0
                }else {
                    num[idx] += 1
                    break
                }
                idx += 1
            }
        }

    }
    
    return result
}