def solution(sizes):
    
    l = len(sizes)
    
    mh = 0
    mw = 0
    conv = list(map(lambda x: (x[1],x[0]) if x[0]>x[1] else (x[0],x[1])  ,sizes))
    for w,h in conv:
        mw = max(mw,w)
        mh = max(mh,h)
    
    return mw*mh