import Foundation

func solution(_ t:String, _ p:String) -> Int {
    var array: [String] = []
    for i in 0...(t.count - p.count) {
        let range = t.index(t.startIndex, offsetBy: i)..<t.index(t.startIndex, offsetBy: i + p.count)
        array.append(String(t[range]))
    }
    return array.filter({ Int($0)! <= Int(p)!}).count
}