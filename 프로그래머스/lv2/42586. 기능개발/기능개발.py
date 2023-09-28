# 하루 한 번 배포 시 몇 개의 기능이 배포되는지 배열로 리턴하기
# 1. 기능별 남은 일 수 구하기
# 2. 기능별 며칠 후 배포 가능한지 구하기
# 3. 2번의 배열 순회하며 완료 순으로 배포하기
import math
def minus(x):
    return 100 - x
def solution(progresses, speeds):
    answer = []
    temp = []
    cnt = 1
    leave = list(map(minus, progresses))
    
    for i in range(len(leave)):
        n = math.ceil(leave[i] / speeds[i])
        temp.append(n)
    before = temp[0]
    for i in range(1, len(temp)):
        if before >= temp[i]:
            cnt += 1
        else:
            answer.append(cnt)
            cnt = 1
            before = temp[i]
    answer.append(cnt)
    return answer