def bubble_sort(v):
    n = len(v)

    is_sorted = False

    while (True):
        is_sorted = True

        for i in range(n - 1):
            if v[i] > v[i + 1]:
                aux = v[i]
                v[i] = v[i + 1]
                v[i + 1] = aux

                is_sorted = False

        n = n - 1

        if is_sorted == True:
            break

def main():
    f = open("file.in", "r")

    v = []

    for line in f:
        for x in line.split():
            v.append(int(x))

    bubble_sort(v)

    for i in range(len(v)):
        print(v[i], end=" ")


if __name__ == "__main__":
    main()