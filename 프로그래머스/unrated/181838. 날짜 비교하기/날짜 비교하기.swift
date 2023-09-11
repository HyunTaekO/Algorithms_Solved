import Foundation

func solution(_ date1:[Int], _ date2:[Int]) -> Int {
    var arr = [date1, date2]
    if date1 == date2 { return 0 }
    if arr.sorted(by: { ($0[0], $0[1], $0[2]) < ($1[0], $1[1], $1[2])}).first! == date1 {
        return 1
    }
    return 0
}