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
     * @tparam T Tipul de data pt. partea imaginara si reala a numarului complex (e.g. float, double, long double)
     *     
     * Pentru alte tipuri de date, comportamentul nu este garantat.
     * 
     * @see operator*, operator+, operator-, operator/, abs, conjugate
     */
    template <typename T>
    struct complex
    {
        complex(T real = 0.0, T imag = 0.0)
            : m_real(real), m_imag(imag) { }

        ~complex() = default;

        /// Inmultirea unui scalar cu un numar complex | z * alpha
        complex operator*(const T alpha) const
        { return complex(this->m_real * alpha, this->m_imag * alpha); }

        /// Inmultirea a doua numere complexe | z1 * z2
        complex operator*(const complex& other) const
        {
            return complex(
                this->m_real * other.m_real - this->m_imag * other.m_imag,
                this->m_real * other.m_imag + this->m_imag * other.m_real
            );
        }

        /// Adunarea a doua numere complexe | z1 + z2
        complex operator+(const complex& other) const
        { return complex(this->m_real + other.m_real, this->m_imag + other.m_imag); }

        /// Adunarea unui numar complex cu un scalar | z + alpha
        complex operator+(const T alpha) const
        { return complex(this->m_real + alpha, this->m_imag); }

        /// Scaderea dintre doua numere complexe | z1 - z2
        complex operator-(const complex& other) const
        { return complex(this->m_real - other.m_real, this->m_imag - other.m_imag); }

        /// Scaderea dintre un numar complex si un scalar | z - alpha
        complex operator-(const T alpha) const
        { return complex(this->m_real - alpha, this->m_imag); }

        /// Impartirea a doua numere complexe | z1 / z2
        complex operator/(const complex& other) const
        {
            complex z_conj = other.conjugate();

            T numitor = other.m_real * other.m_real + other.m_imag * other.m_imag;

            if (numitor == 0)
                throw std::runtime_error("Division by 0!\n");

            return complex(
                (this->m_real * z_conj.m_real - this->m_imag * z_conj.m_imag) / numitor,
                (this->m_real * z_conj.m_imag + this->m_imag * z_conj.m_real) / numitor
            );
        }

        /// Impartirea unui numar complex cu un scalar | z1 / alpha
        complex operator/(const T alpha) const
        { 
            if (alpha == 0)
                throw std::runtime_error("Division by 0!\n");

            return complex(this->m_real / alpha, this->m_imag / alpha);     
        }

        /// Modulul unui numar complex
        T abs() const
        { return std::sqrt(this->m_real * this->m_real + this->m_imag * this->m_imag); }

        /// Conjugatul unui numar complex
        complex conjugate() const
        { return complex(this->m_real, -this->m_imag); }

        /// Metode pt. accesarea var. private
        const T& real() const noexcept { return this->m_real; }
        const T& imag() const noexcept { return this->m_imag; } 

    private:
        T m_real, m_imag;
    };

    /// func. pentru suportul operatiilor, unde alpha este operandul din stanga (alpha _op_ z)

    template <typename T>
    complex<T> operator+(const T alpha, const complex<T>& z)
    { return complex<T>(z.real() + alpha, z.imag()); }

    template <typename T>
    complex<T> operator*(const T alpha, const complex<T>& z)
    { return complex<T>(z.real() * alpha, z.imag() * alpha); }

    template <typename T>
    complex<T> operator-(const T alpha, const complex<T>& z)
    { return complex<T>(alpha - z.real(), -z.imag()); }
    
    /// Operatorul `<<` afiseaza direct numarul complex (a+bi)
    template <typename T>
    std::ostream& operator<<(std::ostream& os, const complex<T>& z)
    {
        os << z.real();

        if (z.imag() >= 0)
            os << "+";

        os << z.imag() << "i";

        return os;
    }

    /**
     * @brief template pt. verificarea solutiilor
     * @tparam T Tipul de data
     */
    template <typename T>
    struct verif_rad
    {
        void operator()(T a, T b, T c, T x1)
        {
            const T era = std::abs(a * x1 * x1 + b * x1 + c);
            if (era < eps_2p)
                std::cout << "  Rezultat corect!\n";
            else
                std::cout << "  Rezultat incorect!\n";
        }

        void operator()(T a, T b, T c, T x1, T x2)
        {
            const T era_1 = std::abs(a * x1 * x1 + b * x1 + c),

            era_2 = std::abs(a * x2 * x2 + b * x2 + c);

            if (era_1 < eps_2p && era_2 < eps_2p)
                std::cout << "  Rezultat corect!\n";
            else
                std::cout << "  Rezultat incorect!\n";
        }

        void operator()(T a, T b, T c, complex<T> x1, complex<T> x2);
    };
} // L1_Utils

namespace std
{
    /// compatibilitatea functiei @c std::abs cu tipul de data @c L2_Utils::complex
    template <typename T>
    T abs(const L2_Utils::complex<T>& z) { return z.abs(); }
}

template <typename T>
void L2_Utils::verif_rad<T>::operator()(T a, T b, T c, L2_Utils::complex<T> x1, L2_Utils::complex<T> x2)
{
    const T era_1 = std::abs(x1 * x1 * a + x1 * b + c),

    era_2 = std::abs(x2 * x2 * a + x2 * b + c);

    if (era_1 < eps_2p && era_2 < eps_2p)
        std::cout << "  Rezultat corect!\n";
    else
        std::cout << "  Rezultat incorect!\n";
}

int main()
{   
    L2_Utils::verif_rad<double> verificare_radacini;

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

            verificare_radacini(a, b, c, x1);
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

            verificare_radacini(a, b, c, x1, x2);
        }
        else if (delta == 0)
        {
            x1 = x2 = -b / (2 * a);

            std::cout << "x1 = x2 = " << x1 << '\n';

            verificare_radacini(a, b, c, x1);
        }
        else
        {
            std::cout << "\n  Ecuatia are 2 solutii complexe:  ";

            const double a_delta = -delta, s_delta = std::sqrt(a_delta), 
                img = s_delta / (2 * a), real = -b / (2 * a);

            L2_Utils::complex<double> x1c(real, -img), x2c(real, img);

            std::cout << "x1c = " << x1c << "  " << "x2c = " << x2c << '\n';

            verificare_radacini(a, b, c, x1c, x2c);
        }
    }

    return 0;
}