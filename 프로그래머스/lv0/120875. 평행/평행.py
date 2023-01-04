def get_inclination(dotA, dotB):
    dx = dotB[0] - dotA[0]
    dy = dotB[1] - dotA[1]
    return dy / dx

def solution(dots):
    dots.sort(key = lambda x:x[0])
    a, b, c, d = dots

    d1 = get_inclination(a, b)
    d2 = get_inclination(c, d)

    if d1 == d2:
        return 1
    return 0