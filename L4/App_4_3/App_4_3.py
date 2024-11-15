# 
# PCLP1 | L4
#   - Verificam daca  trei perechi de puncte (xi,yi) formează un triunghi
#   - Verificam daca este un triunghi dreptunghic, isoscel sau echilateral
#   - arie triunghi 
# 
# File: App_4_3.py
# 

from math import sqrt

class Point:
    x : float
    y : float

    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __repr__(self):
        return f"({self.x}, {self.y})"

    def input(self):
        self.x = float(input("x = "))
        self.y = float(input("y = "))
        
def main():
    A = Point(0, 0)
    B = Point(0, 0)
    C = Point(0, 0)

    print("A:")
    A.input()

    print("B:")
    B.input()

    print("C:")
    C.input()

    delta = abs(A.x * B.y + B.x * C.y + C.x * A.y - C.x * B.y - B.x * A.y - A.x * C.y)

    if delta != 0:
        print(f"Punctele {A}, {B}, {C} formeaza un triunghi!\n")

        AB = sqrt((B.x - A.x) * (B.x - A.x) + (B.y - A.y) * (B.y - A.y))
        AC = sqrt((C.x - A.x) * (C.x - A.x) + (C.y - A.y) * (C.y - A.y))
        BC = sqrt((C.x - B.x) * (C.x - B.x) + (C.y - B.y) * (C.y - B.y))

        if AB == AC and AC == BC:
            print("Triunghi echilateral!\n")
        elif AB == AC or AC == BC or AB == BC:
            print("Triunghi isoscel!\n")
        
        area = delta / 2;

        if area == AB * AC / 2 or area == AB * BC / 2 or area == AC * BC / 2:
            print("Triunghi dreptunghic!\n")

        print(f"area = {area}")
    else:
        print(f"Punctele {A}, {B}, {C} sunt coliniare!\n")

if __name__ == "__main__":
    main()