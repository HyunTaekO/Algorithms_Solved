import Foundation

let T = Int(readLine()!)!

var function: [String] = []
var g = ""
var inputArr: [String] = []
for _ in 1...T {
    function.append(readLine()!)
    g = readLine()!
    inputArr.append(readLine()!)
}

for i in 0..<T {
   
    if inputArr[i] == "[]" {
        if function[i].contains("D") {
            print("error")
            continue
        }else {
            print("[]")
            continue
        }
    }
    
    inputArr[i].removeFirst()
    inputArr[i].removeLast()

    var arr = inputArr[i].components(separatedBy: ",").map{ Int(String($0))! }
    
    if function[i].filter({ $0 == "D"}).count > arr.count {
        print("error")
        continue
    }
    
    var cntR = false
    var lD = 0
    var rD = 0
    for i in function[i] {
        if i == "R" {
            cntR = !cntR
        }else if i == "D" {
            if cntR {
                rD += 1
            }else {
                lD += 1
            }
        }
    }
    arr = Array(arr[lD..<arr.count-rD])
    if cntR {
        print("[", terminator: "")
        for i in 1...arr.count {
            let index = arr.count - i
            if index == 0 {
                print("\(arr[index])", terminator: "")
            }else {
                print("\(arr[index]),", terminator: "")
            }
        }
        print("]")
    }else {
        print("[", terminator: "")
        for i in 0..<arr.count {
            if i == arr.count-1 {
                print("\(arr[i])", terminator: "")
            }else {
                print("\(arr[i]),", terminator: "")
            }
        }
        print("]")
    }
    
}