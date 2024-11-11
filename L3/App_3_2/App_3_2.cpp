/**
 * @brief PCLP1 | L3
 *      Calcularea sumei S si determinarea err.
 *
 * @file App_3_2.cpp
 */

#include <iostream>
#include <cmath>

double fact(unsigned int n)
{
    if (n == 0)
        return 1;

    return n * fact(n - 1);
}

double s(double x, int N)
{
    if (N <= 0)
        throw std::runtime_error("N trebuie sa fie pozitiv!\n");

    double suma = 0;

    for (unsigned int i = 0; i < N; ++i)
        suma += (std::pow(-1, i) / fact(2 * i + 1)) * std::pow(x, 2 * i + 1);

    return suma;
}

int main()
{
    int N = 0;
    double x = 0;

    std::cout << "  N = "; std::cin >> N;
    std::cout << "  x = "; std::cin >> x;

    try
    {
        double suma = s(x, N);
        
        std::cout << "  s = " << suma << '\n';
        std::cout << "  err = " << std::abs((suma - std::sin(x)) / std::sin(x)) << '\n';
    }
    catch(const std::exception &e)
    {
        std::cerr << "  Error: " << e.what() << "\n";
    }

    return 0;
}