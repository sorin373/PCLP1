def main():
    while True:
        n = int(input("n impar (0 < n < 20):"))

        if n % 2 != 0 and n > 0 and n < 20:
            break

    m = [[1 for _ in range(n)] for _ in range(n)]
        
    for i in range(n):
        for j in range(n):
            if i == j or j == n - i - 1 or j == n // 2 or i == n // 2:
                m[i][j] = 0

    for row in m:
        print(row)

    s = 0

    for i in range(n):
        for j in range(n):
            if j % 2 != 0:
                s += m[j][i]

    print(s)

if __name__ == "__main__":
    main()