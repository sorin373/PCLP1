# 
# PCLP1 | L2
# Rezolvarea ecuatiei de gradul 2.
# 
# File: App_2_1.py
# 

import cmath
import math

eps_2p = 1e-10

def verif_rad(a, b, c, x1, x2=None):
    if x2 is None:
        if abs(a * x1 * x1 + b * x1 + c) < eps_2p:
            print("  Rezultat corect!")
        else:
            print("  Rezultat incorect!")
    else:
        if (abs(a * x1 * x1 + b * x1 + c) < eps_2p and 
            abs(a * x2 * x2 + b * x2 + c) < eps_2p):
            print("  Rezultat corect!")
        else:
            print("  Rezultat incorect!")

def get_input():

    print("\n\n  Coeficientii ecuatiei:\n\n")

    a = float(input("  a = "))
    b = float(input("  b = "))
    c = float(input("  c = "))

    print("  =================\n")

    return a, b, c

def main():
    a, b, c = get_input()

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

            verif_rad(a, b, c, x1)
    else:
        print("\n  Ecuatie de gradul 2:  ")

        delta = b * b - 4 * a * c

        if (delta > 0):
            s_delta = math.sqrt(delta)

            print("\n  Ecuatia are 2 solutii reale:  ")

            x1 = (-b - s_delta) / (2 * a)
            x2 = (-b + s_delta) / (2 * a)

            print("  x1 = %f  x2 = %f\n" % (x1, x2))

            verif_rad(a, b, c, x1, x2)
        elif (delta == 0):
            x1 = x2 = -b / (2 * a)

            print("  x1 = x2 = %f\n" % (x1))

            verif_rad(a, b, c, x1)
        else:
            print("\n  Ecuatia are 2 solutii complexe:  ")

            a_delta = -delta 
            s_delta = math.sqrt(a_delta) 
            img = s_delta / (2 * a)
            real = -b / (2 * a)

            x1c = complex(real, img)
            x2c = complex(real, -img)
            
            print("  x1c = {:.2f}  x2c = {:.2f}\n".format(x1c, x2c))

            verif_rad(a, b, c, x1c, x2c)

if __name__ == "__main__":
    main() 