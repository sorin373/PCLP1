# 
# PCLP1 | L3
# Calcularea factorialului unui numar.
# 
# File: App_3_1.py
# 

from os import system

def main():
    n = 0

    while True:
        system("CLS")
        n = int(input("\n\n  (n >= 0)  n = "))

        if n >= 0:
            break
            
    fact = 1
    while n:
        fact *= n
        n = n - 1
    
    print(f"  n! = {fact}")

if __name__ == "__main__":
    main()