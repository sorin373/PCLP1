!
! PCLP1 | L4
! Calcularea CMMDC-ului si al CMMMC-ului a doua numere.
!
! File: App_4_2.f90
!

PROGRAM main
    IMPLICIT NONE

    INTEGER*8 :: a, b

    WRITE(*, '(A)', ADVANCE='NO') "a = "
    READ(*,*) a

    WRITE(*, '(A)', ADVANCE='NO') "b = "
    READ(*,*) b
    
    WRITE(*,*) "cmmdc: ", cmmdc(a, b)
    WRITE(*,*) "cmmmc: ", cmmmc(a, b)

    CONTAINS

    FUNCTION cmmdc(a, b) RESULT(retval)
        IMPLICIT NONE

        INTEGER*8, INTENT(IN) :: a, b
        INTEGER*8 :: retval, r, ca, cb

        ca = abs(a)
        cb = abs(b)

        DO WHILE(cb .NE. 0)
            r = MOD(a, b)

            ca = b
            cb = r
        END DO

        retval = ca
    END FUNCTION cmmdc

    FUNCTION cmmmc(a, b) RESULT(retval)
        IMPLICIT NONE

        INTEGER*8 :: a, b, retval

        a = abs(a)
        b = abs(b)

        retval = a * b / cmmdc(a, b)
    END FUNCTION cmmmc
END PROGRAM main