/**
 * @brief PCLP1 | L6
 *      Realizați un program care citește un vector de numere intregi dintr-un fisier si il sorteaza crescator folosind
 *      metoda SELECT, il afiseaza pe ecran si il salveaza intr-un fisier.   
 *
 * @file App_6_1.cpp
 */

#include <iostream>
#include <fstream>

namespace L5
{
    void resize(int *&ptr, unsigned int old_size, unsigned int new_size)
    {
        if (new_size == 0)
            return;

        int *t_ptr = static_cast<int*>(malloc(new_size * sizeof(int)));

        if (t_ptr == nullptr)
            throw std::bad_alloc();

        for (unsigned int i = 0; i < old_size; ++i)
            t_ptr[i] = ptr[i];

        free(ptr);
        ptr = t_ptr;
    }
}

void select_sort(int *&v, unsigned int n)
{
    if (v == nullptr || n == 0)
        return;

    for (unsigned int i = 0, N = n - 1; i < N; ++i)
    {
        int minim = i;

        for (unsigned int j = i + 1; j < n; ++j)
            if (v[j] < v[minim])
                minim = j;

        int aux = v[i];
        v[i] = v[minim];
        v[minim] = aux;
    }
}

int main()
{
    std::ifstream fin("file.in");

    if (!fin.is_open())
    {
        std::cerr << "Failed to open file!\n";
        return -1;
    }

    unsigned int n = 0, cap = 0;
    int *v = nullptr, x;

    while (fin >> x)
    {
        if (n >= cap)
        {
            unsigned int new_cap = n * 2 + 1;
            L5::resize(v, cap, new_cap);
            cap = new_cap;
        }

        v[n] = x;
        ++n;
    }

    fin.close();

    select_sort(v, n);

    for (unsigned int i = 0; i < n; ++i)
        std::cout << v[i] << " ";

    std::ofstream fout("file.out");

    if (!fout.is_open())
    {
        std::cerr << "Failed to open file!\n";
        return -1;
    }

    for (unsigned int i = 0; i < n; ++i)
        fout << v[i] << " ";

    fout.close();

    free(v);

    return 0;
}