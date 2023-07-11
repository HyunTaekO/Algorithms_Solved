import Foundation

func solution(_ my_string:String) -> Int {
    return my_string.filter{ Int(String($0)) != nil ? true : false }.map{Int(String($0))!}.reduce(0, +)
}