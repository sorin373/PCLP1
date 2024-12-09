# 
# PCLP1 | L5
#   Realizați un program care citește un vector de numere intregi dintr-un fisier si il sorteaza crescator folosind
#   metoda MINMAX, il afiseaza pe ecran si il salveaza intr-un fisier. 
# 
# File: App_5_2.py
# 

def main():
    f = open("vector.txt", "r")

    v = []

    for line in f:
        for num in line.split():
            v.append(int(num))

    n = len(v)

    for i in range(n):
        for j in range(n):
            if v[i] > v[j]:
                aux = v[i]
                v[i] = v[j]
                v[j] = aux

    for num in v:
        print(num, end=" ")

if __name__ == "__main__":
    main()