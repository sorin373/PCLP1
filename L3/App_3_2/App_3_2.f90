!
! PCLP1 | L3
! Calcularea sumei S si determinarea err.
!
! File: App_3_2.f90
!

MODULE L3_Utils
    IMPLICIT NONE

    CONTAINS

    RECURSIVE FUNCTION fact(n) RESULT(retval)
        IMPLICIT NONE

        INTEGER, INTENT(IN) :: n
        REAL*8 :: retval

        IF (n .EQ. 0) THEN
            retval = 1
            RETURN
        END IF

        retval = n * fact(n - 1)
    END FUNCTION fact

    FUNCTION s(x, N) RESULT(retval)
        IMPLICIT NONE

        REAL*8, INTENT(IN) :: x
        INTEGER, INTENT(IN) :: N
        
        REAL*8 :: retval
        INTEGER :: i

        IF (N <= 0) THEN
            WRITE(*,*) "N trebuie sa fie pozitiv"
            RETURN
        END IF

        retval = 0.0

        DO i = 0, N - 1
            retval = retval + (((-1.0) ** i) / fact(2 * i + 1)) * (x ** (2 * i + 1))
        END DO
    END FUNCTION s
END MODULE L3_Utils

PROGRAM main
    USE L3_Utils
    IMPLICIT NONE

    INTEGER :: N
    REAL*8 :: x, suma

    WRITE(*, '(A)', ADVANCE='NO') "  N = "
    READ(*,*) N
    WRITE(*, '(A)', ADVANCE='NO') "  x = "
    READ(*,*) x

    suma = s(x, N)

    WRITE(*,*) "s = ", suma
    WRITE(*,*) "err = ", abs((suma - sin(x)) / sin(x))
END PROGRAM main