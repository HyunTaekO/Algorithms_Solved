import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    let keypad = [[3,1],[0,0],[0,1],[0,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]]  //keypad 좌표
    var current = [[3,0], [3,2]]  //왼손, 오른손 현재좌표
    var result = ""
    let hand = (hand == "left") ? 0 : 1
    
    for i in numbers {
        if [1,4,7].contains(i) {  //무조건 왼손
            current[0] = keypad[i]
            result += "L"
        } else if [3,6,9].contains(i) {  //무조건 오른손
            current[1] = keypad[i]
            result += "R"
        } else {
            //거리계산
            let leftD = abs(current[0][0]-keypad[i][0]) + abs(current[0][1]-keypad[i][1])  //왼손 거리
            let rightD = abs(current[1][0]-keypad[i][0]) + abs(current[1][1]-keypad[i][1])  //오른손 거리
            
            if leftD == rightD {
                current[hand] = keypad[i]
                result += (hand == 0) ? "L" : "R"
            } else if leftD < rightD {
                current[0] = keypad[i]
                result += "L"
            } else {
                current[1] = keypad[i]
                result += "R"
            }
        }
    }
    return result
}