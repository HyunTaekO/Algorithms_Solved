var N = Int(readLine()!)!
let first = readLine()!.map{ String($0) }.sorted()
var similar = 0

for _ in 1..<N {
    var word = readLine()!.map{ String($0) }.sorted()
    var same = 0
    
    for i in 0..<first.count {
        if let s = word.firstIndex(of: first[i]) {
            same += 1
            word.remove(at: s)
        }
    }
    if same == first.count && word.count < 2 || same == first.count-1 && word.count < 2 {
        similar += 1
    }

  
}
print(similar)