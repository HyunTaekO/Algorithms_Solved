import Foundation
var input = readLine()!
var count = input.count


var arr = ["c=","c-","dz=","d-","lj","nj","s=","z="]

for i in 0...arr.count-1 {
    input = input.replacingOccurrences(of: arr[i] , with: "1")
}
print(input.count)