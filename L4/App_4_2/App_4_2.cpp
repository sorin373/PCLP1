/**
 * @brief PCLP1 | L4
 *      Calcularea CMMDC-ului si al CMMMC-ului a doua numere.
 *
 * @file App_4_2.cpp
 */

#include <iostream>

uint64_t cmmdc(int a, int b)
{
    a = std::abs(a);
    b = std::abs(b);

    while (b != 0)
    {
        int r = a % b;
        a = b;
        b = r;
    }

    return static_cast<uint64_t>(a);
}

uint64_t cmmmc(int a, int b)
{
    a = std::abs(a);
    b = std::abs(b);

    uint64_t a64 = static_cast<uint64_t>(a);
    uint64_t b64 = static_cast<uint64_t>(b);

    return a64 * b64 / cmmdc(a, b);
}

int main()
{
    int a, b;

    std::cout << "a = "; std::cin >> a;
    std::cout << "b = "; std::cin >> b;

    std::cout << "cmmdc(a,b) = " << cmmdc(a, b) << "\ncmmmc(a,b) = " << cmmmc(a,b);

    return 0;
}