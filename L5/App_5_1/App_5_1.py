# 
# PCLP1 | L5
#   - Construiti, afisati si salvati intr-un fisier o matrice pătratică cu n linii și n coloane (matricea trebuie alocata dinamic) 
#   - Calculati suma s elementelor de index par (elementele matricei se indexeaza/linearizeaza dupa coloane)  
# 
# File: App_5_1.py
# 

import numpy as np

def main():
    while True:
        n = int(input("n impar (0 < n < 20): "))

        if n % 2 != 0 and n > 0 and n < 20:
            break

    # o matrice n * n cu 1
    m = [[1 for _ in range(n)] for _ in range(n)]
        
    for i in range(n):
        for j in range(n):
            # // pentru a lua doar partea intreaga
            if i == j or j == n - i - 1 or j == n // 2 or i == n // 2:
                m[i][j] = 0

    np.savetxt("matrice.out", np.array(m), fmt="%d", delimiter=" ")

    s = 0
    cnt = 0

    for i in range(n):
        for j in range(n):
            if cnt % 2 != 0:
                s += m[j][i]
            
        cnt = cnt + 1

    print(f"s = {s}")

if __name__ == "__main__":
    main()