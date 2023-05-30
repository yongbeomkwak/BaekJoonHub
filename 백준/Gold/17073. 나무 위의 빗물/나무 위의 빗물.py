from sys import stdin
from collections import defaultdict


def main():
    def input():
        return stdin.readline().rstrip()

    n, w = map(int, input().split())
    degrees = defaultdict(int)
    leaf = n - 1
    for _ in range(n - 1):
        u, v = map(int, input().split())
        degrees[u] += 1
        degrees[v] += 1

        if u != 1 and degrees[u] == 2:
            leaf -= 1
        if v != 1 and degrees[v] == 2:
            leaf -= 1

    print(w / leaf)


if __name__ == "__main__":
    main()