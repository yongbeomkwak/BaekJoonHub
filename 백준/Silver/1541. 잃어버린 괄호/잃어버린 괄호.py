import sys
sys.setrecursionlimit(2500)


if __name__ == "__main__":

    str_ = sys.stdin.readline()
    tmp = ""
    plus = True
    result = 0

    for i in range(len(str_)):

        if (str_[i] == "+" or str_[i] == "-" or str_[i] == "\n"):
            if plus:
                result += int(tmp)
            else:
                result -= int(tmp)
            if str_[i] == "-":
                plus = False
            tmp = ""
            continue

        tmp += str_[i]

    print(result)
