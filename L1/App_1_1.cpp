/**
 * @brief PCLP | L1
 *    Folosirea functiilor matematice si de formatare ( @c cmath ; @c iomanip )
 * 
 * @file App_1_1.cpp
 */

#include <iostream>
#include <cmath>
#include <iomanip>

#define CALC_PRECISION 9

namespace L1_Utils
{
    double ctan(const double a)
    {
        double __sin_a = std::sin(a);

        if (__sin_a == 0)
            throw std::invalid_argument("Division by 0!\n");

        return std::cos(a) / __sin_a;
    }

    double to_rad(const double a)
    {
        return a * M_PI / 180;
    }

    double to_degrees(const double a)
    {
        return a * 180 / M_PI;
    }

    double sqrtn(const double x, const double ord)
    {
        if (ord == 0)
            throw std::invalid_argument("Division by 0!\n");

        return std::pow(x, 1 / ord);
    }

    short sgn(const double x)
    {
        return (x > 0) ? 1 : ((x < 0) ? - 1 : 0);
    }

    double C_to_K(const double t)
    {
        return t * 274.15;
    }

    double C_to_F(const double t)
    {
        return t * 33.8;
    }
} // namespace L1_Utils

double a = 0.0, b = 0.0, c = 0.0, d = 0.0;

void get_input()
{
    std::cout << "\n\t-- USER_INPUT \n\n";
    std::cout << "\ta = "; std::cin >> a;
    std::cout << "\tb = "; std::cin >> b;
    std::cout << "\tc = "; std::cin >> c;
    std::cout << "\td = "; std::cin >> d;
}

void ex_a()
{
    std::cout << "\n\t-- Operatii si functii de librarie (cmath / iomanip):\n\n" << std::fixed << std::setprecision(CALC_PRECISION);

    double r = 0.0;

    r = a + b;
    std::cout << "\t[1]:  " << a << " + " << b << " = " << r << '\n';

    r = b - c;
    std::cout << "\t[2]:  " << b << " - " << c << " = " << r << '\n';

    r = c * d;
    std::cout << "\t[3]:  " << c << " * " << d << " = " << r << '\n';
    
    std::cout << "\t[4]:  " << d << " / " << a << " = ";

    if (a != 0.0) 
    {
        r = d / a;
        std::cout << r << '\n';
    }
    else 
        std::cout << "N/A\n";
    
    r = std::sin(a);
    std::cout << "\t[5]:  " << "sin(" << a << ") = " << r << '\n';

    r = std::sin(L1_Utils::to_rad(a));
    std::cout << "\t[6]:  " << "sin(" << a << ") = " << std::scientific << r << '\n';

    r = std::cos(b);
    std::cout << std::fixed << std::setprecision(CALC_PRECISION) << "\t[7]:  " << "cos(" << b << ") = " << r << '\n';

    r = std::tan(c);
    std::cout << "\t[8]:  " << "tan(" << c << ") = " << r << '\n';

    r = L1_Utils::ctan(d);
    std::cout << "\t[9]:  " << "ctan(" << d << ") = " << r << '\n';

    r = L1_Utils::to_degrees(std::asin(a));
    std::cout << "\t[10]: " << "asin(" << a << ") = " << r << " [deg]\n";

    r = L1_Utils::to_degrees(std::acos(a));
    std::cout << "\t[11]: " << "acos(" << a << ") = " << r << " [deg]\n";
    
    std::cout << "\t[12]: " << "atan(" << d << " / " << c << ") = ";

    if (c != 0.0)
    {
        r = L1_Utils::to_degrees(std::atan(d / c)); 
        std::cout << r << " [deg]\n";
    }
    else 
        std::cout << "N/A\n";

    r = std::atan2(d, c);
    std::cout << "\t[13]: " << "atan2(" << d << ", " << c <<") = " << r << '\n';

    std::cout << "\t[14]: " << "atan(" << -d << " / " << -c <<") = ";

    if (c != 0.0)
    {
        r = L1_Utils::to_degrees(std::atan(-d / -c));
        std::cout << r << " [deg]\n";
    }
    else 
        std::cout << "N/A\n";

    r = std::atan2(-d, -c);
    std::cout << "\t[15]: " << "atan2(" << -d << " / " << -c <<") = " << r << '\n';
    
    std::cout << "\t[16]: " << "ln(" << a << ") = ";

    if (a > 0)
    {
        r = std::log(a);
        std::cout << r << '\n';
    }
    else 
        std::cout << "N/A\n";

    std::cout << "\t[17]: " << "lg(" << b << ") = ";

    if (b > 0)
    {
        r = std::log10(b);
        std::cout << r << '\n';
    }
    else 
        std::cout << "N/A\n";
    
    r = std::exp(a);
    std::cout << "\t[18]: " << "pow(e, " << a << ") = " << r << '\n';

    std::cout << "\t[19]: " << "sqrt(" << a << ") = ";

    if (a < 0)
    {
        a = -a;
        r = std::sqrt(a);

        std::cout << r << "i\n";
    }
    else
    {
        r = std::sqrt(a);
        std::cout << r << '\n';
    }

    r = L1_Utils::sqrtn(d, 3);
    std::cout << "\t[20]: " << "cube root(" << d << ") = " << r << '\n';

    r = std::sqrt(std::pow(c, 2) + std::pow(d, 2));
    std::cout << "\t[21]: " << "sqrt(pow(" << c << ", 2) + " << "pow(" << d << ", 2)) = " << r << '\n';

    r = L1_Utils::sgn(b);
    std::cout << "\t[22]: " << "sgn(" << b << ") = " << r << '\n';

    r = std::abs(c); 
    std::cout << "\t[23]: " << "abs(" << c << ") = " << r << '\n';

    r = std::abs(-c);
    std::cout << "\t[24]: " << "abs(" << -c << ") = " << r << '\n';

    r = std::ceil(-c);
    std::cout << "\t[25]: " << "ceil(" << -c << ") = " << r << '\n';

    r = std::floor(-c);
    std::cout << "\t[26]: " << "floor(" << -c << ") = " << r << '\n';

    r = std::round(-c);
    std::cout << "\t[27]: " << "round(" << -c << ") = " << r << '\n';

    r = std::pow(a, b);
    std::cout << "\t[28]: " << "pow(" << a << ", " << b << ") = " << r << '\n';
}

void ex_b()
{
    std::cout << "\n\t-- Expresii matematice:\n\n" << std::fixed << std::setprecision(CALC_PRECISION);

    double r = 0.0;
    
    r = std::sqrt(std::pow(b - a, 2) + std::pow(d - b, 2));
    std::cout << "\t[29]: d(P1, P2) = " << r << '\n';

    double arie_patrat = a * a,
        arie_dreptunghi = c * d,
        arie_cerc = M_PI * b * b,
        arie_triunghi_drep = a * d / 2;

    std::cout << "\t[30]: a. Arie patrat = "           << arie_patrat         << " mm^2\n";
    std::cout << "\t      b. Arie dreptunghi = "       << arie_dreptunghi     << " mm^2\n";
    std::cout << "\t      c. Arie cerc = "             << arie_cerc           << '\n';
    std::cout << "\t      d. Arie triunghi drept. = "  << arie_triunghi_drep  << " mm^2\n";

    const double F = 10000.0;

    r = F / arie_patrat;
    std::cout << "\t[31]: a. P patrat = " << r << " N / m^2\n";

    r = F / arie_dreptunghi;
    std::cout << "\t      b. P dreptunghi = " << r << " N / m^2\n";

    r = F / arie_cerc;
    std::cout << "\t      c. P cerc = "  << r << " N / m^2\n";

    r = F / arie_triunghi_drep;
    std::cout << "\t      d. P triunghi drept. = " << F / arie_triunghi_drep << " N / m^2\n";

    const double g = 9.80; 

    r = L1_Utils::C_to_K(a);
    std::cout << "\t[32]: T = " << r << " K = ";

    r = L1_Utils::C_to_F(a);
    std::cout << r << " F\n";

    r = a * g * b / 1000 * std::sin(L1_Utils::to_rad(c)) * std::cos(L1_Utils::to_rad(1));
    std::cout << "\t[33]: LGx = " << std::scientific << r << " J\n"; 
}

int main()
{
    system("CLS");

    get_input();
    ex_a();
    ex_b();

    return 0;
}