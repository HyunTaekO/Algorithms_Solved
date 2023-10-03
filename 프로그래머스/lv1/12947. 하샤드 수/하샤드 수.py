def solution(x):
    xs = str(x)
    s = 0
    for n in xs:
        s += int(n)
    if x % s:
        return False
    return True