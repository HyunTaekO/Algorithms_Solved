import Foundation

func dfs(_ visited: [Bool],_ net: [[Int]],_ start: Int) -> [Bool] {
    var visitedC = visited
    visitedC[start] = true 
    for i in net[start] {
        if !visitedC[i] {
            visitedC = dfs(visitedC, net, i)
        }
    }
    return visitedC
}
func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited = Array(repeating: false, count: n)
    var result = 0
    let t = Array(repeating: true, count: n)
    var net: [[Int]] = Array(repeating: [], count: n)
    for i in 0..<n {
        for j in 0..<computers[i].count {
            if computers[i][j] == 1 {
                net[i].append(j)
            }
        }
    }
    while visited != t{
        print(visited)
        if let start = visited.firstIndex(of: false) {
            visited = dfs(visited, net, start)
            result += 1
        }else {
            break
        }
    }
    
    return result
}