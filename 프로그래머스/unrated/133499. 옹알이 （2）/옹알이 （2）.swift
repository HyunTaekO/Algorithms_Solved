import Foundation

func solution(_ babbling:[String]) -> Int {
    
    return babbling.map{ count($0) }.filter{ $0 }.count
}

func count(_ word: String) -> Bool {
    var babble = ["aya", "ye", "woo", "ma"]
    var result = ""
    var lastWord = ""
    
    for i in word.map { String($0) } {
        result += i
        
        if babble.contains(result) && result != lastWord {
            lastWord = result
            result = ""
        }
    }
    return result.isEmpty
}