let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = input[0]
let k = input[1]
let maxCount = 100001
var queue = [(n, 0)]
var idx = 0
var visited = Array(repeating: false, count: maxCount)
while idx < queue.count {
    let pop = queue[idx]
    if pop.0 == k {
        print(pop.1)
        break
    }
    if pop.0 * 2 < maxCount && !visited[pop.0 * 2] {
        visited[pop.0 * 2] = true
        queue.append((pop.0 * 2, pop.1 + 1))
    }
    if pop.0 - 1 >= 0 && !visited[pop.0 - 1] {
        visited[pop.0 - 1] = true
        queue.append((pop.0 - 1, pop.1 + 1))
    }
    if pop.0 + 1 < maxCount && !visited[pop.0 + 1] {
        visited[pop.0 + 1] = true
        queue.append((pop.0 + 1, pop.1 + 1))
    }
    idx += 1
}