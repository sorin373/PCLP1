# 
# PCLP1 | L6
#   Realizați un program care citește un vector de numere intregi dintr-un fisier si il sorteaza crescator folosind
#   metoda SELECT, il afiseaza pe ecran si il salveaza intr-un fisier.  
# 
# File: App_6_1.py
# 

def select_sort(v):
    n = len(v)

    for i in range(n - 1):
        minim = i

        for j in range(i + 1, n):
            if v[j] < v[minim]:
                minim = j

        aux = v[i]
        v[i] = v[minim]
        v[minim] = aux


def main():
    f = open("file.in", "r")

    v = []

    for line in f:
        for x in line.split():
            v.append(int(x))

    select_sort(v)

    for i in range(len(v)):
        print(v[i], end=" ")   

if __name__ == "__main__":
    main()