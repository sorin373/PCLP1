/**
 * @brief PCLP1 | L3
 *      Determinarea N minim a.i err < eps.
 *
 * @file App_3_3.cpp
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
    double eps = 0, x = 0;

    std::cout << "  eps = "; std::cin >> eps;
    std::cout << "  x = "; std::cin >> x;

    try
    {
        unsigned int N = 1;
        double suma = 0, err = 0;
        
        do
        {
            suma = s(x, N);
            err = std::abs((suma - std::sin(x)) / std::sin(x));

            ++N;
            
        } while (err > eps);

        --N;

        std::cout << "  N = " << N << '\n';
    }
    catch(const std::exception &e)
    {
        std::cerr << "  Error: " << e.what() << "\n";
    }

    return 0;
}