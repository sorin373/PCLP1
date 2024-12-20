/**
 * @brief PCLP1 | L5
 *      Realizați un program care citește un vector de numere intregi dintr-un fisier si il sorteaza crescator folosind
 *      metoda MINMAX, il afiseaza pe ecran si il salveaza intr-un fisier. 
 *
 * @file App_5_2.cpp
 */

#include <iostream>
#include <fstream>

#define PATH "vector.txt"

int main()
{
    std::ifstream fin(PATH);

    if (!fin.is_open())
        std::cerr << "Failed to open `" << PATH << "`\n";

    unsigned int n = 0, cnt = 0;
    int x, *v;

    while (fin >> x)
    {
        ++cnt;

        if (cnt > n)
        {
            int *aux = static_cast<int*>(malloc(cnt * sizeof(int)));

            for (unsigned int i = 0; i < n; ++i)
                aux[i] = v[i];

            aux[n] = x;

            free(v);

            v = aux;
            n = cnt;
        }
    }

    for (unsigned int i = 0, N = n - 1; i < N; ++i)
        for (unsigned int j = i + 1; j < n; ++j)
            if (v[i] > v[j])
            {
                int aux = v[i];
                v[i] = v[j];
                v[j] = aux;
            }

    for (unsigned int i = 0; i < n; ++i)
        std::cout << v[i] << " ";

    free(v);
    fin.close();

    return 0;
}