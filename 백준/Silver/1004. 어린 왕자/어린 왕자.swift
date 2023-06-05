import Foundation
var T = Int(readLine()!)!

while T > 0 {
    let tmp = readLine()!.split(separator: " ").map{Int($0)!}
    let start = (x: tmp[0], y: tmp[1])
    let  end = (x: tmp[2], y: tmp[3])
    
    let n = Int(readLine()!)!
    var cnt = 0
    for i in 0..<n{
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        
        //출발지점과 주어진 원 비교
        var startResult = getDistance(x1: start.x, y1: start.y, x2: input[0], y2: input[1], r: input[2])
        //도착지점과 주어진 원 비교
        var endResult = getDistance(x1: end.x, y1: end.y, x2: input[0], y2: input[1], r: input[2])
        
        //둘 중 하나만 지날 때 cnt += 1
        //둘 다 true인 경우는 주황색 원(= 출발과 도착이 둘 다 원 내부에 있을 때) 카운트 X
        //둘다 false인 경우는 아예 상관 없는 원
        if startResult == true && endResult == false {
            cnt += 1
        }else if startResult == false && endResult == true{
            cnt += 1
        }
    }
    print(cnt)
    T -= 1
}

//점과 점 사이의 거기를 구하는 함수
//기준점이 원의 내부에 존재하면 return true
//                존재하지 않으면 return false
func getDistance(x1: Int, y1: Int, x2: Int, y2: Int, r: Int) -> Bool{
    let distance = pow(Double(x1 - x2), 2) + pow(Double(y1 - y2), 2)
    if distance < pow(Double(r), 2){
        return true
    }else{
        return false
    }
}