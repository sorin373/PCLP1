# PCLP - L1 - py

from os import system
import math

def ctan(__a):
    __sin_a = math.sin(__a)

    if (__sin_a == 0):
        raise Exception("Division by 0!\n")

    return math.cos(__a) / __sin_a

def to_rad(__a):     return __a * math.pi / 180
def to_degrees(__a): return __a * 180 / math.pi

def sqrtn(__x, __ord):
    if (__ord == 0):
        raise Exception("Division by 0!\n")

    return math.pow(__x, 1 / __ord)

def C_to_K(__t): return __t * 274.15
def C_to_F(__t): return __t * 33.8

a = 0.0
b = 0.0
c = 0.0
d = 0.0

def get_input():
    global a, b, c, d

    print("\n\t-- USER_INPUT \n\n")

    a = float(input("\ta = "))
    b = float(input("\tb = "))
    c = float(input("\tc = "))
    d = float(input("\td = "))

def ex_a():
    global a, b, c, d
    
    print("\n\t-- Operatii si functii de librarie (cmath / iomanip):\n\n")

    print("\t[1]: %f + %f = %f" % (a, b, a + b))
    print("\t[2]: %f - %f = %f" % (b, c, b - c))
    print("\t[3]: %f * %f = %f" % (c, d, c * d))
    print("\t[4]: %f / %f = " % (d, a), end="")

    if (a != 0.0):
        print(d / a)
    else:
        print("N/A")

    print("\t[5]: sin(%f) = %f" % (a, math.sin(a)))
    print("\t[6]: sin(%f) = %f" % (a, math.sin(to_rad(a))))
    print("\t[7]: cos(%f) = %f" % (b, math.cos(b)))
    print("\t[8]: tan(%f) = %f" % (c, math.tan(c)))
    print("\t[9]: ctan(%f) = %f" % (d, ctan(d)))
    print("\t[10]: asin(%f) = %f" % (a, to_degrees(math.asin(a))))
    print("\t[11]: acos(%f) = %f" % (a, to_degrees(math.acos(a))))
    print("\t[12]: atan(%f / %f) = " % (d, c), end="")

    if (c != 0.0):
        print(to_degrees(math.atan(d / c)))
    else:
        print("N/A")
    
    print("\t[13]: atan2(%f, %f) = %f" % (d, c, math.atan2(d, c)))
    print("\t[14]: atan(%f / %f) = " % (-d, -c), end="")

    if (c != 0):
        print(math.atan(-d / -c))
    else:
        print("N/A")

    print("\t[15]: atan2(%f, %f) = %f" % (-d, -c, math.atan2(-d, -c)))
    print("\t[16]: ln(%f) = " % (a), end="")

    if (a > 0):
        print(math.log(a))
    else:
        print("N/A")

    print("\t[17]: lg(%f) = " % (b), end="")

    if (b > 0):
        print(math.log10(b))
    else:
        print("N/A")

    print("\t[18]: pow(e, %f) = %f" % (a, math.exp(a)))
    print("\t[19]: sqrt(%f) = " % (a), end="")

    if (a < 0):
        a = -a
        print(math.sqrt(a), "i")
    else:
        print(math.sqrt(a))

    print("\t[20]: cube root(%f) = %f" % (d, sqrtn(d, 3)))
    print("\t[21]: sqrt(pow(%f, 2) + pow(%f, 2)) = %f" % (c, d, math.sqrt(math.pow(c, 2) + math.pow(c, 2))))
    
    # `1` se transforma in functie de semnul lui `b`
    print("\t[22]: sgn(%f) = %f" % (b, math.copysign(1, b)))
    print("\t[23]: abs(%f) = %f" % (c, abs(c)))
    print("\t[24]: abs(%f) = %f" % (-c, abs(-c)))
    print("\t[25]: ceil(%f) = %f" % (-c, math.ceil(-c)))
    print("\t[26]: floor(%f) = %f" % (-c, math.floor(-c)))
    print("\t[27]: round(%f) = %f" % (-c, round(-c)))
    print("\t[28]: pow(%f, %f) = %f" % (a, b, math.pow(a, b)))

def ex_b():
    print("\n\t-- Expresii matematice:\n\n")

    arie_patrat = a * a
    arie_dreptunghi = c * d
    arie_cerc = math.pi * b * b
    arie_triunghi_drep = a * d / 2

    print("\t[29]: d(P1, P2) = %f" % (math.sqrt(math.pow(b - a, 2) + math.pow(d - b, 2))))
    print("\t[30]: a. Arie patrat = %f mm^2" % (arie_patrat))
    print("\t      b. Arie dreptunghi = %f mm^2" % (arie_dreptunghi))
    print("\t      c. Arie cerc = %f" % (arie_cerc))
    print("\t      d. Arie triunghi drept. = %f mm^2" % (arie_triunghi_drep))

    F = 10000.0

    print("\t[31]: a. P patrat = %f N / m^2" % (F / arie_patrat))
    print("\t      b. P dreptunghi = %f N / m^2" % (F / arie_dreptunghi))
    print("\t      c. P cerc = %f N / m^2" % (F / arie_cerc))
    print("\t      d. P triunghi drept. = %f N / m^2" % (F / arie_triunghi_drep))

    g = 9.80

    print("\t[32]: T = %f K = %f F" % (C_to_K(a), C_to_F(a)))
    print("\t[33]: LGx = %f" % (a * g * b / 1000 * math.sin(to_rad(c)) * math.cos(to_rad(1))))

def main():
    system("CLS")
    get_input()

    ex_a()
    ex_b()

if __name__ == "__main__":
    main() 