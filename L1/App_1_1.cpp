/**
 * @brief PCLP - Lab_1
 *    Folosirea functiilor matematice si de formatare ( @c cmath ; @c iomanip )
 */

#include <iostream>
#include <cmath>
#include <iomanip>

#define CALC_PRECISION 8

double a = 0.0, b = 0.0, c = 0.0, d = 0.0;

namespace impl
{
    inline double ctan(const double __a)
    {
        const double __sin_a = std::sin(__a);

        if (__sin_a == 0)
            throw std::runtime_error("Division by 0!\n");

        return std::cos(__a) / __sin_a;
    }

    inline double to_rad(const double __a)
    {
        return __a * M_PI / 180;
    }

    inline double to_degrees(const double __a)
    {
        return __a * 180 / M_PI;
    }

    inline double sqrtn(const double __x, const double __ord)
    {
        if (__ord == 0)
            throw std::runtime_error("Division by 0!\n");

        return std::pow(__x, 1 / __ord);
    }

    inline short sgn(const double __x)
    {
        return (__x > 0) ? 1 : ((__x < 0) ? - 1 : 0);
    }

    inline double cel_to_kelvin(const double __t)
    {
        return __t * 274.15;
    }

    inline double cel_to_faranh(const double __t)
    {
        return __t * 33.8;
    }
} // namespace impl

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

    std::cout << "\t[1]:  " << a << " + " << b << " = " << a + b << '\n';
    std::cout << "\t[2]:  " << b << " - " << c << " = " << b - c << '\n';
    std::cout << "\t[3]:  " << c << " * " << d << " = " << c * d << '\n';
    std::cout << "\t[4]:  " << d << " / " << a << " = ";

    if (a != 0.0) std::cout << d / a << '\n';
    else std::cout << "N/A\n";
    
    std::cout << "\t[5]:  " << "sin(" << a << ") = " << std::sin(a) << '\n';
    std::cout << "\t[6]:  " << "sin(" << a << ") = " << std::scientific << std::sin(impl::to_rad(a)) << '\n';
    std::cout << std::fixed << std::setprecision(CALC_PRECISION) << "\t[7]:  " << "cos(" << b << ") = " << std::cos(b) << '\n';
    std::cout << "\t[8]:  " << "tan(" << c << ") = " << std::tan(c) << '\n';
    std::cout << "\t[9]:  " << "ctan(" << d << ") = " << impl::ctan(d) << '\n';
    std::cout << "\t[10]: " << "asin(" << a << ") = " << impl::to_degrees(std::asin(a)) << '\n';
    std::cout << "\t[11]: " << "acos(" << a << ") = " << impl::to_degrees(std::acos(a)) << '\n';
    std::cout << "\t[12]: " << "atan(" << d << " / " << c << ") = ";

    if (c != 0.0) std::cout << impl::to_degrees(std::atan(d / c)) << '\n';
    else std::cout << "N/A\n";

    std::cout << "\t[13]: " << "atan2(" << d << ", " << c <<") = " << impl::to_degrees(std::atan2(d, c)) << '\n'; /// verficare pentru 0 la numitor este facuta de atan2
    std::cout << "\t[14]: " << "atan(" << -d << " / " << -c <<") = ";

    if (c != 0.0) std::cout << std::atan(-d / -c) << '\n';
    else std::cout << "N/A\n";

    std::cout << "\t[15]: " << "atan2(" << -d << " / " << -c <<") = " << impl::to_degrees(std::atan2(-d, -c)) << '\n';
    std::cout << "\t[16]: " << "ln(" << a << ") = ";

    if (a > 0) std::cout << std::log(a) << '\n';
    else std::cout << "N/A\n";

    std::cout << "\t[17]: " << "lg(" << b << ") = ";

    if (b > 0) std::cout << std::log10(b) << '\n';
    else std::cout << "N/A\n";
    
    std::cout << "\t[18]: " << "pow(e, " << a << ") = " << std::exp(a) << '\n';
    std::cout << "\t[19]: " << "sqrt(" << a << ") = ";

    if (a < 0)
    {
        a = -a;
        std::cout << std::sqrt(a) << "i\n";
    }
    else
        std::cout << std::sqrt(a) << '\n';

    std::cout << "\t[20]: " << "cube root(" << d << ") = " << impl::sqrtn(d, 3) << '\n';
    std::cout << "\t[21]: " << "sqrt(pow(" << c << ", 2) + " << "pow(" << d << ", 2)) = " 
              << std::sqrt(std::pow(c, 2) + std::pow(d, 2)) << '\n';

    std::cout << "\t[22]: " << "sgn(" << b << ") = "    << impl::sgn(b)   << '\n';
    std::cout << "\t[23]: " << "abs(" << c << ") = "    << std::abs(c)    << '\n';
    std::cout << "\t[24]: " << "abs(" << -c << ") = "   << std::abs(-c)   << '\n';
    std::cout << "\t[25]: " << "ceil(" << -c << ") = "  << std::ceil(-c)  << '\n';
    std::cout << "\t[26]: " << "floor(" << -c << ") = " << std::floor(-c) << '\n';
    std::cout << "\t[27]: " << "round(" << -c << ") = " << std::round(-c) << '\n';
    std::cout << "\t[28]: " << "pow(" << a << ", " << b << ") = " << std::pow(a, b) << '\n';
}

void ex_b()
{
    std::cout << "\n\t-- Expresii matematice:\n\n" << std::fixed << std::setprecision(CALC_PRECISION);

    double arie_patrat = a * a,
        arie_dreptunghi = c * d,
        arie_cerc = M_PI * b * b,
        arie_triunghi_drep = a * d / 2;

    std::cout << "\t[29]: d(P1, P2) = " << std::sqrt(std::pow(b - a, 2) + std::pow(d - b, 2)) << '\n';

    std::cout << "\t[30]: a. Arie patrat = " << arie_patrat << " mm^2\n";
    std::cout << "\t      b. Arie dreptunghi = " << arie_dreptunghi << " mm^2\n";
    std::cout << "\t      c. Arie cerc = " << arie_cerc << '\n';
    std::cout << "\t      d. Arie triunghi drept. = " << arie_triunghi_drep << " mm^2\n";

    const double F = 10000.0;

    std::cout << "\t[31]: a. P patrat = " << F / arie_patrat << " N / m^2\n";
    std::cout << "\t      b. P dreptunghi = " << F / arie_dreptunghi << " N / m^2\n";
    std::cout << "\t      c. P cerc = " << F / arie_cerc << " N / m^2\n";
    std::cout << "\t      d. P triunghi drept. = " << F / arie_triunghi_drep << " N / m^2\n";

    const double g = 9.80; 

    std::cout << "\t[32]: T = " << impl::cel_to_kelvin(a) << " K = " << impl::cel_to_faranh(a) << " F\n";
    std::cout << "\t[33]: LGx = " << std::scientific << a * g * b / 1000 * std::sin(impl::to_rad(c)) * std::cos(impl::to_rad(1)) << " J\n"; 
}

int main()
{
    system("CLS");

    get_input();
    ex_a();
    ex_b();

    return 0;
}