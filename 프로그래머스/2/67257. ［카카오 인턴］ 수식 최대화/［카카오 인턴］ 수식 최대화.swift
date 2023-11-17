import Foundation
//17:24 ~
func solution(_ expression:String) -> Int64 {
    let priority = combination() // 연산자 조합
    let ex = mapping(expression)
    var result: Int64 = 0
    for p in priority {
        result = max(result, cal(ex, p))
    }
    return result
}

func cal(_ expression: [String],_ priority: [String]) -> Int64 {
    var expression = expression
    for po in priority {
        while expression.contains(po) {
            let idx = expression.firstIndex(of: po)!
            let num2 = Int(expression.remove(at: idx + 1))!
            
            switch po {
                case "+":
                    expression[idx-1] = String(Int(expression[idx-1])! + num2)
                case "-":
                    expression[idx-1] = String(Int(expression[idx-1])! - num2)
                default:
                    expression[idx-1] = String(Int(expression[idx-1])! * num2)
            }
            expression.remove(at: idx)
        }
    }
    return abs(Int64(expression[0])!)
}

//수식 배열화
func mapping(_ str: String) -> [String] {
    var result: [String] = []
    var temp = ""
    for c in str {
        switch c {
        case "+", "-", "*":
            result.append(temp)
            result.append(String(c))
            temp = ""
        default:
            temp += String(c)
        }
    }
    result.append(temp)
    return result
}

//연산자 조합 3! 구하기
func combination() -> [[String]] {
    var result: [[String]] = []
    let input: [String] = ["+", "-", "*"]
    var visited = Array(repeating: false, count: 3)
    func combi(_ index: Int,_ now: [String]) {
        if index == 3 {
            result.append(now)
            return
        }
        for i in 0..<input.count {
            if visited[i] == true { continue }
            visited[i] = true
            combi(index + 1, now + [input[i]])
            visited[i] = false
        }
    }
    combi(0, [])
    return result
}