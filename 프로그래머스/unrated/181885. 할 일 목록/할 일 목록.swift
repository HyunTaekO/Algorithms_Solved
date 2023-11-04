import Foundation

func solution(_ todo_list:[String], _ finished:[Bool]) -> [String] {
    return todo_list.enumerated().filter{ !finished[$0.offset] }.map{ String($0.element) }
}