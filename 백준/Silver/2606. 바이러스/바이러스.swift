import Foundation

let computer = Int(readLine()!)!
let n = Int(readLine()!)!
var netArr = Array(repeating: Array<Int>(), count: computer + 1)
for _ in 0..<n {
    let pair = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    netArr[pair[0]].append(pair[1])
    netArr[pair[1]].append(pair[0])
}
var visited = Array(repeating: false, count: computer + 1)

func bfs() {
    var queue = [1]
    
    while !queue.isEmpty {
        let elem = queue.removeFirst()
        
        for i in netArr[elem] {
            if !visited[i] {
                visited[i] = true
                queue.append(i)
            }
        }
    }
    
}
bfs()
print(visited.filter({$0}).count == 0 ? 0 : visited.filter({$0}).count - 1)