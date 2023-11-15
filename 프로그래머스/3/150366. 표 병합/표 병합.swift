// import Foundation

// var table: [[String]] = Array(repeating: Array(repeating: "", count: 51), count: 51) // 표
// var mergeCheck: [[[(Int, Int)]]] = Array(repeating: Array(repeating: [(0, 0)], count: 51), count: 51)

// func solution(_ commands:[String]) -> [String] {
//     var result: [String] = []
    
//     for i in 0..<51 {
//         for j in 0..<51 {
//             mergeCheck[i][j] = [(i, j)]
//         }
//     }
    
//     for command in commands {
//         if let str = separator(command) {
//             result.append(str)
//         }
//     }
    
//     return result
// }

// func updateValue(_ r: Int,_ c: Int,_ value: String) {
//     mergeCheck[r][c].forEach{ linked in 
//                                 table[linked.0][linked.1] = value
//                             }
// }

// func updateValue(_ value1: String,_ value2: String) {
//     table = table.map{ cell in 
//                         if cell.contains(value1) {
//                             return [value2]
//                         }
//                         return cell
//                      }
// }

// func merge(_ r1: Int,_ c1: Int,_ r2: Int,_ c2: Int) {
//     var value = ""
//     let cell1 = table[r1][c1]
//     let cell2 = table[r2][c2]

//     if !cell1.isEmpty {
//         value = cell1
//     }else if !cell2.isEmpty {
//         value = cell2
//     }else {
//         return
//     }
    
//     for cell in mergeCheck[r1][c1] {
//         if mergeCheck[r2][c2].filter({$0 == cell}).count == 0 {
//             mergeCheck[r2][c2].append(cell)
//         }
//         if mergeCheck[cell.0][cell.1].filter({$0 == (r2, c2)}).count == 0 {
//             mergeCheck[cell.0][cell.1].append((r2, c2))
//         }
//     }
//     for cell in mergeCheck[r2][c2] {
//         if mergeCheck[r1][c1].filter({$0 == cell}).count == 0 {
//             mergeCheck[r1][c1].append(cell)
//         }
//         if mergeCheck[cell.0][cell.1].filter({$0 == (r1, c1)}).count == 0 {
//             mergeCheck[cell.0][cell.1].append((r1, c1))
//         }
//     }

//     table[r1][c1] = value
//     table[r2][c2] = value
// }

// func unmerge(_ r: Int,_ c: Int) {
//     mergeCheck[r][c].forEach{ cell in 
//                                 if cell != (r, c) {
//                                     table[cell.0][cell.1] = ""
//                                     mergeCheck[cell.0][cell.1] = [(cell.0, cell.1)]
//                                 }
//                             }
//     mergeCheck[r][c] = [(r, c)]
// }

// func separator(_ command: String) -> String? {
//     let arr = command.split{$0 == " "}.map{ String($0) }
    
//     if arr[0] == "UPDATE" { 
        
//         if arr.count == 4 { // 1. 셀 단일 값 업데이트
//             updateValue(Int(arr[1])!, Int(arr[2])!, arr[3])
//         }else { // 2. value1 -> value2 업데이트
//             updateValue(arr[1], arr[2])
//         }
        
//     }else if arr[0] == "MERGE" { // 3. 셀 병합
        
//         merge(Int(arr[1])!, Int(arr[2])!, Int(arr[3])!, Int(arr[4])!)
        
//     }else if arr[0] == "UNMERGE" { // 4. 셀 병합 해제
//         unmerge(Int(arr[1])!, Int(arr[2])!)
//     }else if arr[0] == "PRINT" { // 5. 셀 출력
//         let result = table[Int(arr[1])!][Int(arr[2])!]
//         return result.isEmpty ? "EMPTY" : result
//     }
    
//     return nil
// }
import Foundation

func solution(_ commands:[String]) -> [String] {
    var content = [[String?]](repeating: [String?](repeating: nil, count: 51), count: 51)
    var merged = [[(Int, Int)]]()
    var answer = [String]()
    
    for y in 0...50 {
        var line = [(Int, Int)]()
        for x in 0...50 {
            line.append((y, x))
        }
        merged.append(line)
    }
    
    for command in commands {
        let line = command.split(separator: " ").map{ String($0) }
        
        switch line[0] {
        case "UPDATE":
            if line.count == 4 {
                var oldY = Int(line[1])!
                var oldX = Int(line[2])!
                var (realY, realX) = merged[oldY][oldX]
                
                content[realY][realX] = line[3]
                
            } else {
                let oldData = line[1]
                let newData = line[2]
                
                for y in 1...50 {
                    for x in 1...50 {
                        if content[y][x] == oldData {
                            content[y][x] = newData
                        }
                    }
                }
            }
        case "MERGE":
            let y1 = Int(line[1])!
            let x1 = Int(line[2])!
            let y2 = Int(line[3])!
            let x2 = Int(line[4])!
            
            if y1 == y2 && x1 == x2 { break }
            
            let (Ay, Ax) = merged[y1][x1]
            let (By, Bx) = merged[y2][x2]
            
            if let data = content[Ay][Ax] {
                content[By][Bx] = data
            } else if let data = content[By][Bx] {
                content[Ay][Ax] = data
            }
            
            
            for y in 1...50 {
                for x in 1...50 {
                    if merged[y][x] == (By, Bx) {
                        merged[y][x] = merged[y1][x1]
                    }
                }
            }
            
            
        case "UNMERGE":
            let oldY = Int(line[1])!
            let oldX = Int(line[2])!
            
            let (realY, realX) = merged[oldY][oldX]
            let data = content[realY][realX]
            
            for y in 1...50 {
                for x in 1...50 {
                    if merged[y][x] == (realY, realX) {
                        merged[y][x] = (y, x)
                        content[y][x] = nil
                    }
                }
            }
            content[oldY][oldX] = data
            
        case "PRINT":
            var oldY = Int(line[1])!
            var oldX = Int(line[2])!
            var (y, x) = merged[oldY][oldX]
            
            
            if let data = content[y][x] {
                answer.append(data)
            } else {
                answer.append("EMPTY")
            }
        default:
            break
        }
    }
    
    return answer
}