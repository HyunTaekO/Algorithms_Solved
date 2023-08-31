import Foundation
var count: [Int] = [0, 0]

func quardZip(_ arr: [[Int]], x: Int, y: Int, w: Int) {
    let firstItem = arr[x][y]
        
    for i in x..<x+w {
        for j in y..<y+w {
            if arr[i][j] != firstItem {
                let halfSize = w / 2
                quardZip(arr, x: x, y: y, w: halfSize)
                quardZip(arr, x: x+halfSize, y: y, w: halfSize)
                quardZip(arr, x: x, y: y+halfSize, w: halfSize)
                quardZip(arr, x: x+halfSize, y: y+halfSize, w: halfSize)
                
                return
            }
        }
    }
    
    count[firstItem] += 1
}

func solution(_ arr:[[Int]]) -> [Int] {
    
    quardZip(arr, x: 0, y: 0, w: arr.count)
    
    return count
}