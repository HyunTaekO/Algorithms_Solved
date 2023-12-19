import Foundation

func solution(_ my_string:String, _ queries:[[Int]]) -> String {
    var result = my_string.map{$0}
    
    for query in queries {
        var start = query[0]
        var end = query[1]
        while start <= end {
            result.swapAt(start, end)
            start += 1
            end -= 1
        }
    }
    return result.map{String($0)}.joined()
}