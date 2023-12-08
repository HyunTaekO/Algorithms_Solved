import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var dic: [String: [(Int, Int)]] = [:]
    var playDic: [String: Int] = [:]
    var result: [Int] = []
    func sortF(_ f: (Int, Int),_ s: (Int, Int)) -> Bool {
        return f.1 == s.1 ? f.0 < s.0 : f.1 > s.1
    }
    for i in 0..<genres.count {
        if let list = dic[genres[i]], let sum = playDic[genres[i]] {
            var update = list + [(i, plays[i])]
            update = update.sorted(by: sortF)
            dic[genres[i]] = update
            playDic[genres[i]] = sum + plays[i]
        }else {
            dic[genres[i]] = [(i, plays[i])]
            playDic[genres[i]] = plays[i]
        }
    }
    let sortKey = playDic.keys.sorted(by: {playDic[$0]! > playDic[$1]!})
    for key in sortKey {
        let v = dic[key]! 
        if v.count == 1 { result.append(v[0].0); continue }
        result += [v[0].0, v[1].0]
    }
    return result
}