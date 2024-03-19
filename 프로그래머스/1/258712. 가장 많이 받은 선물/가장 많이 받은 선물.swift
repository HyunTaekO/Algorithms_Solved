import Foundation
// 선물을 주고받았다면 더 많이 준사람이 다음달에 하나 받기
// 기록이 없거나 같다면, 선물 지수가 큰사람이 하나 받기 * 선물지수: 자신이 친구들에게 준 선물 수 - 받은 선물 수
// 선물지수도 같다면 다음달도 주고받지 않음
// 선물을 가장 많이 받을 친구가 받을 선물의 수 구하기

// [friends] 2차원 배열 만들기
// gifts 배열을 순회하면서 문자열을 분리하고, 준 사람 이름을 찾기
// 찾은 숫자로 2차원 배열에 접근해서 주고받은선물 카운팅하기
// 카운팅된 2차원 배열로 다음달에 주고받을 선물 계산해서 매핑하기
// 

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var gt = Array(repeating: Array(repeating: 0, count: friends.count),count: friends.count)
    var dic: [String: Int] = friends.reduce(into: [:]) { $0[$1] = friends.lastIndex(of: $1)! }
    var gl: [Int] = []
    var nextM: [Int] = Array(repeating: 0, count: friends.count)
    var visited = Array(repeating: Array(repeating: false, count: friends.count), count: friends.count)
    for gift in gifts {
        let split = gift.split{$0 == " "}
        let g = dic[String(split[0])]!
        let t = dic[String(split[1])]!
        gt[g][t] += 1
        gt[t][g] -= 1
    }
    
    gt.forEach{ elem in 
                gl.append(elem.reduce(0, +))
              }

    for i in 0..<gt.count {
        for j in 0..<friends.count {
            if gt[i][j] == 0 && i != j && !visited[i][j] {
                if gl[i] < gl[j] {
                    nextM[j] += 1
                }else if gl[i] > gl[j] {
                    nextM[i] += 1
                }
                visited[i][j] = true
                visited[j][i] = true
            }else if gt[i][j] > 0 {
                nextM[i] += 1
            }
            
        }  
    }
    return nextM.max()!
}