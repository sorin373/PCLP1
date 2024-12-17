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

void insertion_sort(int *&v, unsigned int n)
{
    if (v == nullptr || n == 0)
        return;

    for (unsigned int i = 1; i < n; ++i)
    {
        int key = v[i], j = i - 1;

        while (j >= 0 && v[j] > key)
        {
            v[j + 1] = v[j];
            --j;
        }

        v[j + 1] = key;
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

    insertion_sort(v, n);

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
