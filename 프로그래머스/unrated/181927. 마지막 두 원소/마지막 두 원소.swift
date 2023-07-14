import Foundation

func solution(_ num_list:[Int]) -> [Int] {
    var num_list = num_list
    let last = num_list[num_list.count-1]
    let before = num_list[num_list.count-2]
    if last > before {
        num_list.append(last - before)
        return num_list
    }else {
        num_list.append(last * 2)
        return num_list
    }
}