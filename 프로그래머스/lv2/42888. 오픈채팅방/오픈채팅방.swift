import Foundation

func solution(_ record:[String]) -> [String] {
    var log: [String] = []
    var dic: [String: String] = [:] // [uid: nickname]
    for r in record {
        let split = r.split(separator: " ").map{ String($0) }
        let io = split[0]
        let uid = split[1]
    
        guard io != "Leave" else { log.append("\(uid) 님이 나갔습니다."); continue}
            
        let nick = split[2]
        dic[uid] = nick
        if io == "Enter" {
            log.append("\(uid) 님이 들어왔습니다.")
        }
          
    }
    let result = log.map{ str -> String in
               let words = str.components(separatedBy: " ")
               return "\(dic[words[0]]!)\(words[1]) \(words[2])" 
              }
    return result
}