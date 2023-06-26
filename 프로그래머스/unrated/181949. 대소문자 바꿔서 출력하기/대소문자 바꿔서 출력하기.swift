import Foundation

let s1 = readLine()!
var str = ""
for i in s1 {
    if i.isUppercase {
        str += i.lowercased()
    }else {
        str += i.uppercased()
    }
}
print(str)