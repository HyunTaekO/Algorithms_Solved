func selfNumber() {
    for i in 1...10000 {
        for j in 1...i {
            
            if i == j + (j/10000) + (j/1000) + ((j%1000)/100) + ((j%100)/10) + (j%10) {
                break
            }else if j == i {
                print(i)
            }
        }
    }
}
selfNumber()