from sys import stdin
from collections import defaultdict


def main():
    def input():
        return stdin.readline().rstrip()

    n, w = map(int, input().split())
    degrees = defaultdict(int)
    for _ in range(n - 1):
        u, v = map(int, input().split())
        degrees[u] += 1
        degrees[v] += 1

    leaf = 0
    for i in range(2, n + 1):
        if degrees[i] == 1:
            leaf += 1
    print(w / leaf)


if __name__ == "__main__":
    main()