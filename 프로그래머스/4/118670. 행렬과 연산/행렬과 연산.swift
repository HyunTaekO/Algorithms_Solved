import Foundation
// 성공 : 효율성 실패..
//덱 자료구조
// struct Deque<T: Equatable> {
//     var enqueue: [T]
//     var dequeue: [T] = []
//     var count: Int {
//         return enqueue.count + dequeue.count
//     }
//     var isEmpty: Bool {
//         return enqueue.isEmpty && dequeue.isEmpty
//     }
//     var first: T? {
//         if dequeue.isEmpty {
//             return enqueue[0]
//         }
//         return dequeue.last
//     }
//     var last: T? {
//         if enqueue.isEmpty {
//             return dequeue[0]
//         }
//         return enqueue.last
//     }
//     init(_ queue: [T]) {
//         enqueue = queue
//     }
//     mutating func print() -> [T] {
//         let f = dequeue.reversed()
//         return Array(f) + enqueue
//     }
//     mutating func pushFirst(_ n: T) {
//         dequeue.append(n)
//     }
//     mutating func pushLast(_ n: T) {
//         enqueue.append(n)
//     }
//     mutating func popFirst() -> T? {
//         if dequeue.isEmpty {
//             dequeue = enqueue.reversed()
//             enqueue.removeAll()
//         }
//         return dequeue.popLast()
        
//     }
//     mutating func popLast() -> T? {
//         var returnValue: T?
//         if enqueue.isEmpty {
//             dequeue = dequeue.reversed()
//             returnValue = dequeue.popLast()
//             dequeue = dequeue.reversed()
//         } else {
//             returnValue = enqueue.popLast()
//         }
//         return returnValue
//     }
//     mutating func contains(_ n: T) -> Bool {
//         return enqueue.contains(n) || dequeue.contains(n)
//     }
//     mutating func removeAll() {
//         enqueue.removeAll()
//         dequeue.removeAll()
//     }
// }

// func solution(_ rc:[[Int]], _ operations:[String]) -> [[Int]] {
//     var rows = rc.map{ Deque<Int>(Array($0[1..<rc[0].count-1])) }
//     var leftCol = Deque<Int>([])
//     var rightCol = Deque<Int>([])
//     var idx = Deque<Int>(Array(0..<rc.count))
    
//     var result: [[Int]] = []
    
//     for i in 0..<rc.count {
//         let row = rc[i]
//         leftCol.pushLast(row[0])
//         rightCol.pushLast(row[row.count-1])
//     }
    
//     func rotation() {
//         rows[idx.first!].pushFirst(leftCol.popFirst()!)
//         rightCol.pushFirst(rows[idx.first!].popLast()!)
//         rows[idx.last!].pushLast(rightCol.popLast()!)
//         leftCol.pushLast(rows[idx.last!].popFirst()!)
//     }

//     func shiftRow() {
//         leftCol.pushFirst(leftCol.popLast()!)
//         rightCol.pushFirst(rightCol.popLast()!)
//         idx.pushFirst(idx.popLast()!)
//     }
    
//     for o in operations {
//         if o == "Rotate" {
//             rotation()
//         }else {
//             shiftRow()
//         }        
//     }

//     for r in 0..<rc.count {
//         let index = idx.popFirst()!
//         result.append([leftCol.popFirst()!] + rows[index].print() + [rightCol.popFirst()!])
//     }
//     return result
// }

class Node {
    var val: Int
    var front: Node? = nil
    var rear: Node? = nil
    var up: Node? = nil
    var down: Node? = nil
    init() {
        val = 0
    }
    init(_ val: Int, _ front: Node?, _ rear: Node?, _ up: Node?, _ down: Node?) {
        self.val = val
        self.front = front
        self.rear = rear
        self.up = up
        self.down = down
    }
    
    func popH() {
        if front != nil { front?.rear = rear }
        if rear != nil { rear?.front = front}
    }
    func popV() {
        if up != nil { up?.down = down }
        if down != nil { down?.up = up }
    }
}
var front: [Node] = []
var rear: [Node] = []
var sf: Node = Node(), sr: Node = Node(), ef: Node = Node(), er: Node = Node()
var leftFront = Node(), leftRear = Node(), rightFront = Node(), rightRear = Node()

func initQueues(_ r: Int) {
    for i in 0..<r {
        front.append(Node())
        rear.append(Node())
        front[i].rear = rear[i]
        rear[i].front = front[i]
    }
    sf.down = sr
    sr.up = sf
    ef.down = er
    er.up = ef
    
    leftFront.down = leftRear
    leftRear.up = leftFront
    rightFront.down = rightRear
    rightRear.up = rightFront
}

func solution(_ rc:[[Int]], _ operations:[String]) -> [[Int]] {
    var answer: [[Int]] = []
    initQueues(rc.count)
    
    for i in 0..<rc.count {
        for j in 1..<rc[i].count-1 {
            let node = Node()
            node.val = rc[i][j]
            node.front = rear[i].front;
            node.rear = rear[i];
            rear[i].front?.rear = node;
            rear[i].front = node;
        }
        let n = Node()
        n.val = rc[i][0];
        n.up = leftRear.up;
        n.down = leftRear;
        leftRear.up?.down = n;
        leftRear.up = n;

        let v = Node()
        v.val = rc[i][rc[i].count - 1];
        v.up = rightRear.up;
        v.down = rightRear;
        rightRear.up?.down = v;
        rightRear.up = v;
    }
    
    for i in 0..<rc.count {
        front[i].up = sr.up;
        front[i].down = sr;
        sr.up?.down = front[i];
        sr.up = front[i];

        rear[i].down = er;
        rear[i].up = er.up;
        er.up?.down = rear[i];
        er.up = rear[i];
    }
    
    for i in 0..<operations.count {
        if (operations[i] == "ShiftRow") {
            let left = sr.up
            let right = er.up
            sr.up?.popV()
            er.up?.popV()

            left?.up = sf
            left?.down = sf.down
            sf.down?.up = left
            sf.down = left

            right?.up = ef
            right?.down = ef.down
            ef.down?.up = right
            ef.down = right

            let ll = leftRear.up
            let rr = rightRear.up
            leftRear.up?.popV()
            rightRear.up?.popV()

            ll?.up = leftFront
            ll?.down = leftFront.down
            leftFront.down?.up = ll
            leftFront.down = ll

            rr?.up = rightFront
            rr?.down = rightFront.down
            rightFront.down?.up = rr
            rightFront.down = rr
        } else {
            let left = leftFront.down
            leftFront.down?.popV()

            left?.front = sf.down
            left?.rear = sf.down?.rear

            sf.down?.rear?.front = left
            sf.down?.rear = left
            let ru = ef.down?.front
            ef.down?.front?.popH()

            ru?.up = rightFront
            ru?.down = rightFront.down

            rightFront.down?.up = ru
            rightFront.down = ru
            let rd = rightRear.up
            rightRear.up?.popV()

            rd?.front = er.up?.front
            rd?.rear = er.up

            er.up?.front?.rear = rd;
            er.up?.front = rd;
            let ld = sr.up?.rear
            sr.up?.rear?.popH()

            ld?.down = leftRear
            ld?.up = leftRear.up

            leftRear.up?.down = ld
            leftRear.up = ld
        }
    }

    var nd = sf.down
    let end: Node? = sr
    
    var nf: Node? = ef.down
    var left: Node? = leftFront.down
    var right = rightFront.down
    while nd !== end {
        var inp: [Int] = []
        var start = nd?.rear
        inp.append(left?.val ?? 0)
        while start !== nf {
            inp.append(start?.val ?? 0)
            start = start?.rear
        }
        inp.append(right?.val ?? 0)
        answer.append(inp)
        nd = nd?.down
        left = left?.down
        right = right?.down
        nf = nf?.down
    }
    
    return answer
}
