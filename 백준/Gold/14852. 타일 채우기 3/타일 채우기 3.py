import sys, math
read=sys.stdin.readline

n=int(read())
if n ==1:
    print(2)
    sys.exit()
elif n == 2:
    print(7)
    sys.exit()

dp = list(0 for _ in range(n+1))
dp[0]=1
dp[1]=2
dp[2]=7

for i in range(3,n+1):
    dp[i] = (3*dp[i-1] + dp[i-2] - dp[i-3])%1000000007
print(dp[n])