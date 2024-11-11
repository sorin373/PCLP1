# 
# PCLP1 | L3
# Calcularea sumei S si determinarea err.
# 
# File: App_3_2.py
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
    N = int(input("  N = "))
    x = float(input("  x = "))

    try:
        suma = s(x, N)
        print(f"  s = {suma}")

        err = abs((suma - sin(x)) / sin(x))
        print(f"  err = {err}")
    except Exception as e:
        print(f"  Error: {e}")

if __name__ == "__main__":
    main()