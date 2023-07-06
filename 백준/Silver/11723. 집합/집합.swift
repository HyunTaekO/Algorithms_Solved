import Foundation

class FileIO {
    @inline(__always) private var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0], byteIdx = 0
    
    @inline(__always) private func readByte() -> UInt8 {
        defer { byteIdx += 1 }
        return buffer.withUnsafeBufferPointer { $0[byteIdx] }
    }
    
    @inline(__always) func readInt() -> Int {
        var number = 0, byte = readByte(), isNegative = false
        while byte == 10 || byte == 32 { byte = readByte() }
        if byte == 45 { byte = readByte(); isNegative = true }
        while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
        return number * (isNegative ? -1 : 1)
    }
    
    @inline(__always) func readStirngSum() -> Int {
        var byte = readByte()
        while byte == 10 || byte == 32 { byte = readByte() }
        var sum = Int(byte)
        while byte != 10 && byte != 32 && byte != 0 { byte = readByte(); sum += Int(byte) }
        return sum - Int(byte)
    }
    
    @inline(__always) private func write(_ output: String) {
        FileHandle.standardOutput.write(output.data(using: .utf8)!)
    }
}
//시간 줄인요소
//1. Wapas님 입출력
//2. print() result에 모아서 한번에 출력

let file = FileIO()
var m = file.readInt()

var bit = 0
var result = ""
while m != 0{
//    let oper = file.readStirngSum()
//    let x = file.readInt()
    switch file.readStirngSum(){
    case 297:
        bit |= (1 << file.readInt())
    case 654:
        bit &= ~(1 << file.readInt())
    case 510:
        
        if (bit & (1 << file.readInt()) != 0){
            result.append("1\n")
        }else{
            result.append("0\n")
        }
    case 642:
        bit ^= (1 << file.readInt())
    case 313:
        bit |= (~0)
    case 559:
        bit &= 0
    default:
        break
    }
    m -= 1
}
print(result)