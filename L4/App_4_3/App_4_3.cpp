/**
 * @brief PCLP1 | L4
 *      - Verificam daca  trei perechi de puncte (xi,yi) formează un triunghi
 *      - Verificam daca este un triunghi dreptunghic, isoscel sau echilateral
 *      - arie triunghi 
 *
 * @file App_4_3.cpp
 */

#include <iostream>
#include <cmath>

struct Point
{
    double x, y;

    Point() = default;
    ~Point() = default;
};

std::istream& operator>>(std::istream& is, Point& P)
{
    std::cout << "x = "; is >> P.x;
    std::cout << "y = "; is >> P.y;

    return is;
}

std::ostream& operator<<(std::ostream& os, Point& P)
{
    os << '(' << P.x << ", " << P.y << ')';
    return os;
}

int main()
{
    Point A, B, C;

    std::cout << "A:\n"; std::cin >> A;
    std::cout << "B:\n"; std::cin >> B;
    std::cout << "C:\n"; std::cin >> C;

    double delta = std::abs(A.x * B.y + B.x * C.y + C.x * A.y - C.x * B.y - B.x * A.y - A.x * C.y);

    if (delta != 0)
    {
        std::cout << "Punctele " << A << ", " << B << ", " << C << " formeaza un triunghi!\n";

        double AB = std::sqrt((B.x - A.x) * (B.x - A.x) + (B.y - A.y) * (B.y - A.y)),
            AC = std::sqrt((C.x - A.x) * (C.x - A.x) + (C.y - A.y) * (C.y - A.y)),
            BC = std::sqrt((C.x - B.x) * (C.x - B.x) + (C.y - B.y) * (C.y - B.y));

        if (AB == AC && AC == BC)
            std::cout << "Triunghi echilateral!\n";
        else if (AB == AC || AC == BC || AB == BC)
            std::cout << "Triunghi isoscel!\n";
        
        double area = delta / 2;

        if (area == AB * AC / 2 || area == AB * BC / 2 || area == AC * BC / 2)
            std::cout << "Triunghi dreptunghic!\n";

        std::cout << "area = " << area;
    }
    else
        std::cout << "Punctele " << A << ", " << B << ", " << C << " sunt coliniare!\n";

    return 0;
}