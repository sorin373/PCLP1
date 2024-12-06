#include <iostream>

template <typename T>
T allocate(const unsigned int p_size)
{
    T ptr = static_cast<T>(malloc(p_size * sizeof(T)));

    if (ptr == nullptr)
        throw std::bad_alloc();

    return ptr;
}

int main()
{
    try
    {
        unsigned int n;

        do
        {
            std::cout << "n impar (0 < n < 20): ";
            std::cin >> n;
        } while (n % 2 == 0 || n <= 0 || n >= 20);

        bool **m = allocate<bool**>(n);

        for (unsigned int i = 0; i < n; ++i)
            m[i] = static_cast<bool*>(malloc(n * sizeof(bool)));

        for (unsigned int i = 0; i < n; ++i)
            for (unsigned int j = 0; j < n; ++j)
                m[i][j] = (i == j || j == n - i - 1 || j == n / 2 || i == n / 2) ? false : true;

        for (unsigned int i = 0; i < n; ++i)
        {
            for (unsigned int j = 0; j < n; ++j)
                std::cout << m[i][j] << " ";

            std::cout << '\n';
        }

        unsigned int s = 0, cnt = 0;

        for (unsigned int i = 0; i < n; ++i)
            for (unsigned int j = 0; j < n; ++j)
            {
                if (cnt % 2 != 0)
                    s += m[j][i];

                ++cnt;
            }


        std::cout << "s = " << s;

        for (unsigned int i = 0; i < n; ++i)
            free(m[i]);

        free(m);
    }
    catch (const std::bad_alloc& e)
    {
        std::cerr << "Memory allocation failed: " << e.what() << '\n';
    }

    return 0;
}