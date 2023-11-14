import Foundation

let n = Int(readLine()!)!

var graph = Array(repeating: Array<Int>(), count: n)
var result = Array(repeating: Array(repeating: 0, count: n), count: n)

for i in 0..<n {
    graph[i] = readLine()!.split{$0 == " "}.map{ Int(String($0))! }
}

func bfs() {
    for i in 0..<n {
        var visited = Array(repeating: false, count: n)
        //visited[i] = true
        //result[i][i] = 1
        var queue = [i]
        var idx = 0
        
        while idx < queue.count {
            let node = queue[idx]
            for nextNode in 0..<n {
                guard !visited[nextNode] && graph[node][nextNode] == 1 else{ continue }
                visited[nextNode] = true
                result[i][nextNode] = 1
                queue.append(nextNode)
            }
            
            idx += 1
        }
    }
}

bfs()
result.forEach{ print($0.map{String($0)}.joined(separator: " ")) }
