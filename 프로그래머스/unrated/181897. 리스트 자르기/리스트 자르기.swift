import Foundation

func solution(_ n:Int, _ slicer:[Int], _ num_list:[Int]) -> [Int] {
    var result: [Int] = []
    switch n {
        case 1:
            result = Array(num_list[0...slicer[1]])
        case 2:
            result = Array(num_list[slicer[0]..<num_list.count])
        case 3:
            result = Array(num_list[slicer[0]...slicer[1]])
        case 4:
            for i in stride(from: slicer[0], through: slicer[1], by: slicer[2]) {
                result.append(num_list[i])
            }
        default:
            return result
    }
    return result
}