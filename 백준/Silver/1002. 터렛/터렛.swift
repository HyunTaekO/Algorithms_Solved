import Foundation

for _ in 0..<Int(readLine()!)! {
	let t = readLine()!.split(separator: " ").map{Int(String($0))!}
	let (x1,y1,r1,x2,y2,r2) = (t[0],t[1],t[2],t[3],t[4],t[5])

	let d = sqrt(Double((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2)))

	//두 원이 일치
	if x1 == x2 && y1 == y2 && r1 == r2 {
		print(-1)
	} 
	//두 점에서 만난다
	else if Double(abs(r1-r2)) < d && d < Double(r1+r2) {
		print(2)
	} 
    //한 점에서 만난다.
    else if Double(r1+r2) == d || Double(abs(r1-r2)) == d {
		print(1)
	} 
    //만나지 않는다
    else {
		print(0)
	}
}