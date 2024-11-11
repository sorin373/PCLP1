!
! PCLP1 | L3
! Calcularea factorialului unui numar.
!
! File: App_3_1.f90
!

PROGRAM main
    IMPLICIT NONE

    INTEGER*8 :: n = 0, fact = 1

    WRITE(*, '(A)', ADVANCE='NO') "  (n >= 0)  n = "
    READ(*,*) n

    DO WHILE (n < 0)
        WRITE(*, '(A)', ADVANCE='NO') "  (n >= 0)  n = "
        READ(*,*) n
    END DO
        
    DO WHILE (n > 0)
        fact = fact * n
        n = n - 1
    END DO

    WRITE(*,*) "  n! = ", fact
END PROGRAM main