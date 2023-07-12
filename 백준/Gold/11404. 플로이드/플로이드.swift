let n = Int(readLine()!)! //도시 개수
let m = Int(readLine()!)! //버스 개수
var graph = Array(repeating: Array(repeating: 10000001, count: n), count: n)

for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map{ Int(String($0))! }
    if abc[0] == abc[1] {
        graph[abc[0]-1][abc[1]-1] = 0
    }else {
        graph[abc[0]-1][abc[1]-1] = min(abc[2], graph[abc[0]-1][abc[1]-1])
    }
}

for k in 0..<n {
    for a in 0..<n {
        for b in 0..<n {
            if a == b || a == k || b == k {
                continue
            }
            
            if graph[a][k] == 100001 || graph[k][b] == 100001 {
                continue
            }
            
            if graph[a][k] + graph[k][b] < graph[a][b] {
                graph[a][b] = graph[a][k] + graph[k][b]
            }
        }
    }
}
for i in graph {
    print(i.map{ $0 == 10000001 ? "0" : String($0) }.joined(separator: " "))
}