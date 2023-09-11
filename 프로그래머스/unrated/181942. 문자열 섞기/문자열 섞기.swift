import Foundation

func solution(_ str1:String, _ str2:String) -> String {
    var result = ""
    let arr1 = str1.map{ String($0) }
    let arr2 = str2.map{ String($0) }
    for i in 0..<arr1.count {
        result += arr1[i]
        result += arr2[i]
    }
    return result
}