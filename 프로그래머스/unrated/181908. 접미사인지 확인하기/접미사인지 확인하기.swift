import Foundation

func solution(_ my_string:String, _ is_suffix:String) -> Int {
    let str = my_string.map{ String($0) }
    for i in 0..<str.count {
        if str[i..<str.count].joined() == is_suffix { return 1 }
    }
    return 0
}