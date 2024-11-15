# 
# PCLP1 | L4
# Determinarea daca un numar este prim si perfect.
# 
# File: App_4_1.py
# 

def is_prime(n):
    if n <= 1:
        return False

    for d in range(2, int(n / 2) + 1):
        if n % d == 0:
            return False
    
    return True

def is_perfect(n):
    n = abs(n)
    
    sum = 1

    for d in range(2, int(n / 2) + 1):
        if n % d == 0:
            sum = sum + d

    return sum == n

def main():
    n = int(input("n = "))

    print(f"Prime: {is_prime(n)}")
    print(f"Perfect: {is_perfect(n)}")

if __name__ == "__main__":
    main()  