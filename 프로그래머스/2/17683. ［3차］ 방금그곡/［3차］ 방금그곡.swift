// 11/16 18:50 -> 
// 재생 시간을 몇 분간 재생했는지 분 단위로 변환한다.
// 곡의 멜로디를 재생된 시간 만큼 이어 붙인 문자열을 생성한다.
// 생성한 문자열을 투포인터를 활용해 m과 일치하는지 판별하고 일치한다면 마지막 + 1 번째가 #인지 확인한다.
// #이 아니라면 정답 배열에 넣는다. 위를 반복해서 모든 정답을 찾는다.
// 정답 배열을 재생시간 > 먼저 입력된 순서 > 로 정렬한다 빈배열일경우 "(None)" 반환

func solution(_ m:String, _ musicinfos:[String]) -> String {
    var result: [(String, Int, Int)] = [] // (제목, 재생시간, 입력순서)
    var my: [String] = []
    m.forEach{ c in 
                if c == "#" {
                    my[my.count-1] += String(c)
                }else {
                    my.append(String(c))
                }
               }
    for i in 0..<musicinfos.count {
        let info = musicinfos[i].split{$0 == ","}.map{ String($0) }
        let playTime = transTime(info[0], info[1])
        let melody = createMelody(info[3], playTime)
        let compare = isSame(my, melody)
        //print(playTime, melody, compare)
        if compare.0 {
            if m.count == melody.count {
                result.append((info[2], playTime, i))
            }else if melody.count-1 >= compare.1 {
                let idx = melody.index(melody.startIndex, offsetBy: compare.1)
                if melody[idx] != "#" {
                    result.append((info[2], playTime, i))
                }
            }else {
                result.append((info[2], playTime, i))
            }
            
        }
    }
    
    guard !result.isEmpty else{ return "(None)"}
    if result.count == 1 { return result[0].0 }
    
    return sortC(result)
}
func sortC(_ result: [(String, Int, Int)]) -> String {
    let maxTime = result.map{ $0.1 }.max()!
    let timeR = result.filter({ $0.1 == maxTime })
    let minInput = result.map{ $0.2 }.min()!
    let inputR = timeR.filter({ $0.2 == minInput })
    if timeR.count == 1 {
        return timeR[0].0
    }else if inputR.count == 1 {
        return inputR[0].0
    }else {
        return "(None)"
    }
    return "(None)"
}

func isSame(_ my: [String],_ other: [String]) -> (Bool, Int) {
    guard my.count < other.count else{ return my == other ? (true, 0) : (false, -1) }
    for start in 0..<other.count-my.count+1 {
        let end = start + my.count - 1
        if my == Array(other[start...end]) { return (true, end + 1) }
    }
    
    return (false, -1)
}

func createMelody(_ str: String,_ time: Int) -> [String] {
    var result: [String] = []
    str.forEach{ c in 
                if c == "#" {
                    result[result.count-1] += String(c)
                }else {
                    result.append(String(c))
                }
               }
    guard result.count < time else{ return Array(result[0..<time]) }
    var index = 0
    while result.count < time {
        result.append(result[index])
        if index == result.count - 1 {
            index = 0
        }else {
            index += 1
        }
    }
    return result
}

func transTime(_ start: String,_ end: String) -> Int {
    let s = (Int(start.prefix(2))! * 60) + Int(start.suffix(2))!
    let e = (Int(end.prefix(2))! * 60) + Int(end.suffix(2))!
    return e - s
}