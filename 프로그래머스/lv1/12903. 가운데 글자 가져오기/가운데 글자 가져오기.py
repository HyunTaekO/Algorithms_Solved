def solution(s):
    mid = len(s) // 2
    if len(s) % 2:
        return s[mid]
    return s[mid-1 : mid+1]