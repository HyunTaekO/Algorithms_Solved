import Foundation

func solution(_ my_string:String) -> [Int] {
    var result: [Int] = []
    for i in 65...90 {
        let cnt = my_string.filter{ $0 == Character(UnicodeScalar(i)!) }.count
        result.append(cnt)
    }
    
    for i in 97...122 {
        let cnt = my_string.filter{ $0 == Character(UnicodeScalar(i)!) }.count
        result.append(cnt)
    }
    
    return result
}