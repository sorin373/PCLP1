#
#  PCLP1 | L2
#  Determinarea coordonatelor punctului P(r, teta) in coordonate polare
# 
#  App_2_2.py
#

import math

eps_2p = 1e-10

def to_degrees(a): return a * 180 / math.pi
def to_rad(a): return a * math.pi / 180

def era(x1, y1):
    if (math.fabs(x1) < eps_2p and math.fabs(y1) < eps_2p):
        print("  Rezultat corect!\n")
    else:
        print("  Rezultat incorect!\n")

def err(x0, y0, x1, y1):
    if (math.fabs(x0) < eps_2p and math.fabs(y0) < eps_2p):
        era(x1, y1)
        return

    verifX = (math.fabs(x1 - x0) / math.fabs(x0) < eps_2p) if x0 != 0 else math.fabs(x1) < eps_2p
    verifY = (math.fabs(y1 - y0) / math.fabs(y0) < eps_2p) if y0 != 0 else math.fabs(y1) < eps_2p

    if (verifX and verifY):
        print("  Rezultat corect!\n")
    else:
        print("  Rezultat incorect!\n")

def main():
    print("\n\n  Introduceti coordonatele:\n")

    x0 = float(input("  x0 = "))
    y0 = float(input("  y0 = "))

    r = math.sqrt(x0 * x0 + y0 * y0)

    if (r == 0):
       print("\n  Raza este 0.\n")
    else:
        teta = to_degrees(math.acos(x0 / r))

        if (y0 < 0):
            teta = 360 - teta

        print("\n  r = %f\n  teta = %f [deg]\n" % (r, teta))

        x1 = r * math.cos(to_rad(teta))
        y1 = r * math.sin(to_rad(teta))

        err(x0, y0, x1, y1)

if __name__ == "__main__":
    main()