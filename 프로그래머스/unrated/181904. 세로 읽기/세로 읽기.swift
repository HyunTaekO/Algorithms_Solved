import Foundation

func solution(_ my_string:String, _ m:Int, _ c:Int) -> String {
    var index = 0
    var cnt = 1
    var result = ""
    var arr: [[String]] = Array(repeating: [String](), count: my_string.count/m)
    for i in my_string {
        if cnt == m {
            arr[index].append(String(i))
            cnt = 1
            index += 1
            continue
        }else {
            arr[index].append(String(i))
            cnt += 1
        }
    }
    for i in arr {
        result += i[c-1]
    }
    return result
}