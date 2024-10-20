import cmath
import math

eps_2p = 1e-10

def verif_rad(x, a, b, c): return abs(a * x * x + b * x + c) < eps_2p

a = 0
b = 0
c = 0

def get_input():
    global a, b, c, d

    print("\n\n  Coeficientii ecuatiei:\n\n")

    a = float(input("  a = "))
    b = float(input("  b = "))
    c = float(input("  c = "))

    print("  =================\n")

def main():
    get_input()

    if (a == 0):
        if (b == 0):
            if (c == 0):
                print("\n  R: inf\n")
            else:
                print("\n  Ecuatia este imposibila\n")
        else:
            print("\n  Ecuatie de gradul 1:  ")
            x1 = -c / b

            print("  x = %f\n" % (x1))

            if (verif_rad(x1, a, b, c)):
                print("  Rezultat corect!\n")
            else:
                print("  Rezultat incorect!\n")
    else:
        print("\n  Ecuatie de gradul 2:  ")

        delta = b * b - 4 * a * c

        if (delta > 0):
            s_delta = math.sqrt(delta)

            print("\n  Ecuatia are 2 solutii reale:  ")

            x1 = (-b - s_delta) / (2 * a)
            x2 = (-b + s_delta) / (2 * a)

            print("  x1 = %f  x2 = %f\n" % (x1, x2))

            if (verif_rad(x1, a, b, c) and verif_rad(x2, a, b, c)):
                print("  Rezultate corecte!\n")
            else:
                print("  Rezultate incorecte!\n")
        elif (delta == 0):
            x1 = x2 = -b / (2 * a)

            print("  x1 = x2 = %f\n" % (x1))

            if (verif_rad(x1, a, b, c)):
                print("  Rezultate corecte!\n")
            else:
                print("  Rezultate incorecte!\n")
        else:
            print("\n  Ecuatia are 2 solutii complexe:  ")

            a_delta = -delta 
            s_delta = math.sqrt(a_delta) 
            img = s_delta / (2 * a)
            real = -b / (2 * a)

            x1c = complex(real, img)
            x2c = complex(real, -img)
            
            print("  x1c = {:.2f}  x2c = {:.2f}\n".format(x1c, x2c))

            if (verif_rad(x1c, a, b, c) and verif_rad(x2c, a, b, c)):
                print("  Rezultate corecte!\n")
            else:
                print("  Rezultate incorecte!\n")

if __name__ == "__main__":
    main() 