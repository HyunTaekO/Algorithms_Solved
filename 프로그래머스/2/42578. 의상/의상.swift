import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var result = 1
    let clothDiv = divide(clothes)
    clothDiv.forEach{ elem in 
                        result *= elem.count + 1
                    }
    return result - 1
}

// 같은 종류 의상으로 분류하는 함수
func divide(_ clothes: [[String]]) -> [[String]] {
    var dic = [String: [String]]()
    var array: [[String]] = []
    for cloth in clothes {
        if let v = dic[cloth[1]] {
            dic[cloth[1]] = v + [cloth[0]]
        }else {
            dic[cloth[1]] = [cloth[0]]
        }
    }
    for key in dic.keys {
        array.append(dic[key]!)
    }
    
    return array
}