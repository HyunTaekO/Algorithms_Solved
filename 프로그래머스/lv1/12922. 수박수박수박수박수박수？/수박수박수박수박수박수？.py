def solution(n):
    str = ''
    if n % 2 == 0:
        return '수박'*(n//2)
    return '수박'*(n//2) + '수'