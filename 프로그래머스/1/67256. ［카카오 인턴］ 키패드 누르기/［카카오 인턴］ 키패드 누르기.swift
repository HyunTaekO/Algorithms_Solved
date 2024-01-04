import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var result = ""
    var right = (3, 0)
    var left = (3, 2)
    
    for n in numbers {
        var dir = false // 왼 / 오 : false / true
        if n == 2 || n == 5 || n == 8 || n == 0 {
            let rd = distance(pad(n), right) 
            let ld = distance(pad(n), left)
            
            if rd == ld {
                if hand == "right" {
                    dir = true
                }
            }else if rd < ld {
                dir = true
            }
        }else if n % 3 == 0 {
            dir = true
        }
        if dir {
            result += "R"
            right = pad(n)
        }else {
            result += "L"
            left = pad(n)
        }
    }
    return result
}

func distance(_ num: (Int, Int),_ cur: (Int, Int)) -> Int {
    return abs(num.0 - cur.0) + abs(num.1 - cur.1)
}

func pad(_ n: Int) -> (Int, Int) {
    switch n {
        case 0:
            return (3, 1)
        case 1:
            return (0, 0)
        case 2:
            return (0, 1)
        case 3:
            return (0, 2)
        case 4:
            return (1, 0)
        case 5:
            return (1, 1)
        case 6:
            return (1, 2)
        case 7:
            return (2, 0)
        case 8:
            return (2, 1)
        case 9:
            return (2, 2)
        default:
            return (0, 0)
    }
    return (0, 0)
}