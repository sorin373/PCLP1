#include <iostream>
#include <cmath>

#define eps_2p 1e-10

double to_degrees(const double a) { return a * 180 / M_PI; }
double to_rad(const double a)     { return a * M_PI / 180; }

void era(double x1, double y1)
{
    if (std::abs(x1) < eps_2p && std::abs(y1) < eps_2p)
        std::cout << "  Rezultat corect!\n";
    else
        std::cout << "  Rezultat incorect!\n";
}

void err(double x0, double y0, double x1, double y1)
{
    if (std::abs(x0) < eps_2p && std::abs(y0) < eps_2p)
    {
        era(x1, y1);
        return;
    }

    bool verifX = (x0 != 0) ? (std::abs(x1 - x0) / x0) < eps_2p : std::abs(x1) < eps_2p;
    bool verifY = (y0 != 0) ? (std::abs(y1 - y0) / y0) < eps_2p : std::abs(y1) < eps_2p;

    if (verifX && verifY)
        std::cout << "  Rezultat corect!\n";
    else
        std::cout << "  Rezultat incorect!\n";
}

int main()
{
    system("CLS");

    double x0 = 0, y0 = 0;

    std::cout << "\n\n  Introduceti coordonatele:\n\n";

    std::cout << "  x0 = "; std::cin >> x0;
    std::cout << "  y0 = "; std::cin >> y0;

    double r = std::sqrt(x0 * x0 + y0 * y0);

    if (r == 0)
    {
        std::cout << "\n  Raza este 0.\n";
        return 0;
    }

    double teta = 0; 

    if (x0 == 0 && y0 > 0)
        teta = 90.0;
    else if (x0 == 0 && y0 < 0)
        teta = 270.0;
    else if (y0 == 0 && x0 > 0)
        teta = 0.0;
    else if (y0 == 0 && x0 < 0)
        teta = 180.0;
    else
    {
        teta = to_degrees(std::acos(std::abs(x0) / r));

        if (x0 < 0 && y0 > 0)
            teta = 180 - teta; 
        else if (x0 < 0 && y0 < 0)
            teta = 180 + teta; 
        else if (x0 > 0 && y0 < 0)
            teta = 360 - teta; 
    }

    std::cout << "\n  r = " << r << "\n  teta = " << teta << " [deg]\n";

    double x1 = r * std::cos(to_rad(teta)), y1 = r * std::sin(to_rad(teta));

    std::cout << "\n";
    
    err(x0, y0, x1, y1);

    return 0;
}
