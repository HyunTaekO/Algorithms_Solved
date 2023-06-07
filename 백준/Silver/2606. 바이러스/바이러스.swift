let computer = Int(readLine()!)!
let connect = Int(readLine()!)!
var node: [[Int]] = Array(repeating: [], count: computer + 1)
var visited = Array(repeating: false, count: computer + 1)

func bfs() {
    var queue = [1]
    visited[1] = true
    while !queue.isEmpty {
        let q = queue.removeFirst()
        for i in node[q] {
            if !visited[i] {
                visited[i] = true
                queue.append(i)
            }
        }
    }
}
for _ in 1...connect {
    let pair = readLine()!.split(separator: " ").map{ Int(String($0))!}
    node[pair[0]].append(pair[1])
    node[pair[1]].append(pair[0])
}

bfs()
print(visited.filter{$0}.count - 1)