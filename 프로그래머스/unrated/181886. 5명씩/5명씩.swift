import Foundation

func solution(_ names:[String]) -> [String] {
    let result = names.enumerated().filter{ $0.offset % 5 == 0 }.map{ $0.element }
    return result
}