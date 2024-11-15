/**
 * @brief PCLP1 | L4
 *      Determinarea daca un numar este prim si perfect.
 *
 * @file App_4_1.cpp
 */

#include <iostream>

bool is_prime(int n)
{
    if (n <= 1)
        return false;

    for (unsigned int d = 2, N = n / 2; d <= N; ++d)
        if (n % d == 0)
            return false;

    return true;
}

bool is_perfect(int n)
{
    n = (n < 0) ? -n : n;

    unsigned int sum = 1;

    for (unsigned int d = 2, N = n / 2; d <= N; ++d)
        if (n % d == 0)
            sum += d;

    return sum == n;
}

int main()
{
    int n = 0;

    std::cout << "n = ";
    std::cin >> n;

    std::cout << "Prime:" << is_prime(n) << "\nPerfect: " << is_perfect(n);

    return 0;
}