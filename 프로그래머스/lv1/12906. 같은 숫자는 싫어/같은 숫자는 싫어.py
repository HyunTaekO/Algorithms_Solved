# 1. 0 ~ 9 까지 Bool 배열 만들기
# 2. 배열 반복하면서 처음 나오는 수는 지나가고, true로 만들고 정답 배열에 추가하기
# 3. false면 지나가기

def solution(arr):
    answer = []
    temp = -1
    arrlen = len(arr)
    for i in range(arrlen):
        if arr[i] == temp:
            continue
        else:
            answer.append(arr[i])
            temp = arr[i]
            
    return answer