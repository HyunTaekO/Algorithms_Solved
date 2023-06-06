public struct Queue<T> {
  fileprivate var array = [T]()
  
  public var isEmpty: Bool {
    return array.isEmpty
  }
  
  public var count: Int {
    return array.count
  }
  
  public mutating func enquque(_ element: T) {
    array.append(element)
  }
  
  public mutating func dequeue() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.removeFirst()
    }
  }
  
  public var front: T? {
    return array.first
  }
}
let input = readLine()!.split(separator: " ").map { Int(String($0))!}
let N = input[0]
let M = input[1]
let V = input[2]
var node: [[Int]] = Array(repeating: [], count: N + 1)
var visited = Array(repeating: false, count: N + 1)
var result = ""
func dfs(_ start: Int) {
    visited[start] = true
    print(start, terminator: " ")
    for i in node[start] {
        if !visited[i] {
            dfs(i)
        }
    }
    
}
var queue = Queue<Int>()
func bfs(_ start: Int) {
  queue.enquque(start) // 시작점 큐에 넣기
  visited[start] = false // 시작점 방문으로 체크
  
  while !queue.isEmpty {
    guard let elem = queue.dequeue() else { return }
    print(elem, terminator: " ")
    
    for i in node[elem] {
      if visited[i] {
        queue.enquque(i)
        visited[i] = false
      }
    }
  }
}
for _ in 1...M {
    let line = readLine()!.split(separator: " ").map{ Int(String($0))!}
    node[line[0]].append(line[1])
    node[line[1]].append(line[0])
    node[line[0]].sort()
    node[line[1]].sort()
}

dfs(V)
print("")
bfs(V)