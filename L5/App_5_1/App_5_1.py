def main():
    while True:
        n = int(input("n impar (0 < n < 20):"))

        if n % 2 != 0 and n > 0 and n < 20:
            break

    # umple o matric n * n cu 1 peste tot
    m = [[1 for _ in range(n)] for _ in range(n)]
        
    for i in range(n):
        for j in range(n):
            # verificare diag. principala, secundara, mijlocul liniei si al col.
            # // pentru a lua doar partea intreaga
            if i == j or j == n - i - 1 or j == n // 2 or i == n // 2:
                m[i][j] = 0

    for row in m:
        print(row)

    s = 0
    cnt = 0

    for i in range(n):
        for j in range(n):
            if cnt % 2 != 0:
                s += m[j][i]
            
            cnt = cnt + 1

    print(s)

if __name__ == "__main__":
    main()