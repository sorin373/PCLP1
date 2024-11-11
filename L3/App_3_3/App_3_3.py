# 
# PCLP1 | L3
# Determinarea N minim a.i err < eps.
# 
# File: App_3_3.py
# 

from math import pow, sin

def fact(n):
    if n == 0:
        return 1

    return n * fact(n - 1)

def s(x, N):
    if N <= 0:
        raise Exception("N trebuie sa fie pozitiv")

    suma = 0

    for i in range(N - 1):
        suma = suma + (pow(-1, i) / fact(2 * i + 1)) * pow(x, 2 * i + 1)

    return suma 

def main():
    eps = float(input("  eps = "))
    x = float(input("  x = "))

    try:
        N = 1

        while True:

            suma = s(x, N)
            err = abs((suma - sin(x)) / sin(x))

            if err < eps:
                break

            N = N + 1

        print(f"  N = {N}")
    except Exception as e:
        print(f"  Error: {e}")

if __name__ == "__main__":
    main()