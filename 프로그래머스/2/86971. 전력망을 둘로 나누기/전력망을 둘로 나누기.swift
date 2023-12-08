import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var graph: [[Int]] = Array(repeating: Array<Int>(), count: n + 1)
    var result = Int.max
    for wire in wires {
        graph[wire[0]].append(wire[1])
        graph[wire[1]].append(wire[0])
    }
    for i in 1..<graph.count {
        for g in 0..<graph[i].count {
            var newG = graph
            newG[i].remove(at: g)
            let cnt = dfs(newG)
            result = min(result, abs(cnt - (n - cnt)))
        }
    }
    return result
}

func dfs(_ graph: [[Int]]) -> Int {
    var result = 1
    var queue = [1]
    var idx = 0
    var visited = Array(repeating: false, count: graph.count)
    visited[1] = true
    while idx < queue.count {
        let now = queue[idx]
        for node in graph[now] {
            if !visited[node] {
                queue.append(node)
                visited[node] = true
                result += 1
            }
        }
        idx += 1
    }
    return result
}