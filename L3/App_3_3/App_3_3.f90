!
! PCLP1 | L3
! Determinarea N minim a.i err < eps.
!
! File: App_3_3.f90
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

    REAL*8 :: x, eps, suma, err
    INTEGER :: N

    WRITE(*, '(A)', ADVANCE='NO') "  eps = "
    READ(*,*) eps
    WRITE(*, '(A)', ADVANCE='NO') "  x = "
    READ(*,*) x

    N = 1

    DO
        suma = s(x, N)
        err = abs((suma - sin(x)) / sin(x))

        IF (err <= eps) EXIT

        N = N + 1
    END DO

    WRITE(*,*) "N = ", N
END PROGRAM main