/**
 * @brief PCLP1 | L3
 *      Calcularea factorialului unui numar.
 *
 * @file App_3_1.cpp
 */

#include <iostream>

int main()
{    
    int n = 0;

    do 
    {
        system("CLS");

        std::cout << "\n\n  (n >= 0)  n = ";
        std::cin >> n;
    } while (n < 0);

    long long unsigned int fact = 1;

    while (n)
    {
        fact *= n;
        --n;
    }

    std::cout << "  n! = " << fact;

    return 0;
}