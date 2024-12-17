def insertion_sort(v):
    n = len(v)

    for i in range(n):
        key = v[i]
        j = i - 1

        while j >= 0 and v[j] > key:
            v[j + 1] = v[j]
            j = j - 1

        v[j + 1] = key

def main():
    f = open("file.in", "r")

    v = []

    for line in f:
        for x in line.split():
            v.append(int(x))

    insertion_sort(v)

    for i in range(len(v)):
        print(v[i], end=" ")


if __name__ == "__main__":
    main()