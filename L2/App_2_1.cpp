/**
 * @brief PCLP1 | L2
 *      Rezolvarea ecuatiei de gradul al 2-lea.
 *
 * @file App_2_1.cpp
 */

#include <iostream>
#include <cmath>

#define eps_2p 1e-10

namespace L2_Utils
{
    /**
     * @brief Structura de date reprezentativa pentru un nr. complex (z = a + bi)
     *     Am implementat doar functiile necesare de calcul matematic cu numere complexe (*, +)
     *     folosite in partea de verificare a solutiilor
     *
     *     @c * intre doua numere complexe, dar si cu un scalar
     *     @c + intre doua numere complexe, dar si cu un scalar
     *
     *     Se poate folosi atat (z + alpha) cat si (alpha + z). Analog pentru inmultire.
     *
     * @tparam T Tipul de data (float | double | long double)
     */
    template <typename T>
    struct complex
    {
        complex(T __r = 0, T __i = 0)
            : m_real(__r), m_imag(__i) { }

        ~complex() = default;

        /// Am folosit operatorul `<<` sa afisez direct numarul complex (a+bi)
        friend std::ostream& operator<<(std::ostream& os, const complex& __c)
        {
            os << __c.m_real;

            if (__c.m_imag >= 0)
                os << "+";

            os << __c.m_imag << "i";

            return os;
        }

        /// Inmultirea unui scalar cu un numar complex | z * alpha
        complex operator*(const T alpha) const
        { return complex(this->m_real * alpha, this->m_imag * alpha); }

        /// Inmultirea a doua numere complexe | z1 * z2
        complex operator*(const complex& other) const
        {
            return complex(
                this->m_real * other.m_real - this->m_imag * other.m_imag,
                this->m_real * other.m_imag + other.m_real * this->m_imag
            );
        }

        /// Adunarea a doua numere complexe | z1 + z2
        complex operator+(const complex& other) const
        { return complex(this->m_real + other.m_real, this->m_imag + other.m_imag); }

        /// Adunarea unui numar complex cu un scalar | z1 + alpha
        complex operator+(const T alpha) const
        { return complex(this->m_real + alpha, this->m_imag); }

        /// Modulul unui numar complex
        T abs() const
        { return std::sqrt(this->m_real * this->m_real + this->m_imag * this->m_imag); }

        /// Metode pt. accesarea var. private
        T& real() noexcept { return this->m_real; }
        T& imag() noexcept { return this->m_imag; }

    private:
        T m_real, m_imag;
    };

    template <typename T>
    complex<T> operator+(const T alpha, complex<T>& c)
    { return complex<T>(c.m_real + alpha, c.m_imag); }

    template <typename T>
    complex<T> operator*(const T alpha, complex<T>& c)
    { return complex<T>(c.m_real * alpha, c.m_imag * alpha); }
} // L1_Utils

namespace std
{
    /// compatibilitate functiei @c std::abs cu tipul de data @c L2_Utils::complex
    template <typename T>
    T abs(L2_Utils::complex<T> c) { return c.abs(); }
}

template <typename T>
bool verif_rad(T x, T a, T b, T c)
{
    const T era = std::abs(a * x * x + b * x + c);
    return era < eps_2p;
}

template <typename T>
bool verif_rad(L2_Utils::complex<T> x, T a, T b, T c)
{
    const L2_Utils::complex<T> era = x * x * a + x * b + c;
    return std::abs(era) < eps_2p;
}

int main()
{
    double a = 0, b = 0, c = 0, x1 = 0, x2 = 0;

    std::cout << "\n\n  Coeficientii ecuatiei:\n\n";

    std::cout << "  a = "; std::cin >> a;
    std::cout << "  b = "; std::cin >> b;
    std::cout << "  c = "; std::cin >> c;

    std::cout << "  =================\n";

    if (a == 0)
    {
        if (b == 0)
        {
            if (c == 0)
                std::cout << "\n  R: inf\n";
            else
                std::cout << "\n  Ecuatia este imposibila\n";
        }
        else
        {
            std::cout << "\n  Ecuatie de gradul 1:  ";
            x1 = -c / b;

            std::cout << "x = " << x1 << '\n';

            if (verif_rad<double>(x1, a, b, c))
                std::cout << "  Rezultat corect!\n";
            else
                std::cout << "  Rezultat incorect!\n";
        }
    }
    else
    {
        std::cout << "\n  Ecuatie de gradul 2:  ";

        const double delta = b * b - 4 * a * c;

        if (delta > 0)
        {
            const double s_delta = std::sqrt(delta);

            std::cout << "\n  Ecuatia are 2 solutii reale:  ";

            x1 = (-b - s_delta) / (2 * a);
            x2 = (-b + s_delta) / (2 * a);

            std::cout << "x1 = " << x1 << "  " << "x2 = " << x2 << '\n';

            if (verif_rad<double>(x1, a, b, c) && verif_rad<double>(x2, a, b, c))
                std::cout << "  Rezultate corecte!\n";
            else
                std::cout << "  Rezultate incorecte!\n";
        }
        else if (delta == 0)
        {
            x1 = x2 = -b / (2 * a);

            std::cout << "x1 = x2 = " << x1 << '\n';

            if (verif_rad<double>(x1, a, b, c))
                std::cout << "  Rezultate corecte!\n";
            else
                std::cout << "  Rezultate incorecte!\n";
        }
        else
        {
            std::cout << "\n  Ecuatia are 2 solutii complexe:  ";

            const double a_delta = -delta, s_delta = std::sqrt(a_delta), img = s_delta / (2 * a);

            L2_Utils::complex<double> x1c, x2c;

            x1c.real() = x2c.real() = -b / (2 * a);

            x1c.imag() = -img;
            x2c.imag() =  img;

            std::cout << "x1c = " << x1c << "  " << "x2c = " << x2c << '\n';

            if (verif_rad<double>(x1c, a, b, c) && verif_rad<double>(x2c, a, b, c))
                std::cout << "  Rezultate corecte!\n";
            else
                std::cout << "  Rezultate incorecte!\n";
        }
    }

    return 0;
}