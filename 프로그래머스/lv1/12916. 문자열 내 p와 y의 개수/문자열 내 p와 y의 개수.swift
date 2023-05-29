import Foundation

func solution(_ s:String) -> Bool
{
    let str = s.lowercased()
    print(str)
    return str.components(separatedBy: "p").count == str.components(separatedBy: "y").count
}