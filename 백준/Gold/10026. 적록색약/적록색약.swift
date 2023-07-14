let n = Int(String(readLine()!))!
var picture: [[String]] = []

for _ in 0..<n {
    picture.append(readLine()!.map({String($0)}))
}

var nomalVisited = Array(repeating: Array(repeating: false, count: n), count: n)
var abNomalVisited = Array(repeating: Array(repeating: false, count: n), count: n)

var stack: [[Int]] = []

var nomalResult = 0
var abNomalResult = 0

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

func nomal() {
    for i in 0..<n {
        for j in 0..<n {
            if !nomalVisited[i][j] {
                nomalVisited[i][j] = true
                stack.append([i, j])
                nomalResult += 1
                while !stack.isEmpty {
                    let pop = stack.removeLast()
                    let x = pop[0]
                    let y = pop[1]
                    let nowColor = picture[x][y]
                    for i in 0..<4 {
                        let nx = x + dx[i]
                        let ny = y + dy[i]
                        guard nx >= 0 && nx < n && ny >= 0 && ny < n && !nomalVisited[nx][ny]
                        else{ continue }
                        
                        if nowColor == picture[nx][ny] {
                            stack.append([nx, ny])
                            nomalVisited[nx][ny] = true
                        }
                    }
                }
            }
        }
    }
}

func abNomal() {
    for i in 0..<n {
        for j in 0..<n {
            if !abNomalVisited[i][j] {
                abNomalVisited[i][j] = true
                stack.append([i, j])
                abNomalResult += 1
                while !stack.isEmpty {
                    let pop = stack.removeLast()
                    let x = pop[0]
                    let y = pop[1]
                    let nowColor = picture[x][y]
                    for i in 0..<4 {
                        let nx = x + dx[i]
                        let ny = y + dy[i]
                        guard nx >= 0 && nx < n && ny >= 0 && ny < n && !abNomalVisited[nx][ny]
                        else{ continue }
                        let newColor = picture[nx][ny]
                        if nowColor == "R" || nowColor == "G" {
                            if newColor == "R" || newColor == "G" {
                                stack.append([nx, ny])
                                abNomalVisited[nx][ny] = true
                            }
                            continue
                        }else if newColor == "B" {
                            stack.append([nx, ny])
                            abNomalVisited[nx][ny] = true
                        }
                    }
                }
            }
        }
    }
}
nomal()
abNomal()
print(nomalResult, abNomalResult)