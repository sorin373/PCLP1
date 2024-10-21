!
! PCLP1 | L2
! Rezolvarea ecuatiei de gradul 2.
!
! File: App_2_1.f90
!

MODULE L2_Utils
    IMPLICIT NONE

    REAL, PARAMETER    :: eps_2p = 1e-10
    INTEGER, PARAMETER :: CALC_PRECISION = 8

    PUBLIC  :: verif_rad
    PRIVATE :: verif_rad_r, verif_rad_c

    ! proceduri de verificare a sol. (toate se folosesc prin interfata `verif_rad`)
    INTERFACE verif_rad
        MODULE PROCEDURE verif_rad_r1, verif_rad_r, verif_rad_c
    END INTERFACE verif_rad

    CONTAINS

    SUBROUTINE verif_rad_r1(a, b, c, x)
        IMPLICIT NONE

        REAL(KIND = CALC_PRECISION), INTENT(IN) :: x, a, b, c
        REAL(KIND = CALC_PRECISION) :: era

        era = abs(a * x * x + b * x + c)

        IF (era .LT. eps_2p) THEN
            WRITE(*,*) "Rezultat corect!"
        ELSE
            WRITE(*,*) "Rezultat incorect!"
        END IF
    END SUBROUTINE verif_rad_r1

    SUBROUTINE verif_rad_r(a, b, c, x1, x2)
        IMPLICIT NONE

        REAL(KIND = CALC_PRECISION), INTENT(IN) :: x1, x2, a, b, c
        REAL(KIND = CALC_PRECISION) :: era_1, era_2

        era_1 = abs(a * x1 * x1 + b * x1 + c)
        era_2 = abs(a * x2 * x2 + b * x2 + c)

        IF (era_1 .LT. eps_2p .AND. era_2 .LT. eps_2p) THEN
            WRITE(*,*) "Rezultat corect!"
        ELSE
            WRITE(*,*) "Rezultat incorect!"
        END IF
    END SUBROUTINE verif_rad_r

    SUBROUTINE verif_rad_c(a, b, c, x1, x2)
        IMPLICIT NONE

        COMPLEX(KIND = CALC_PRECISION), INTENT(IN) :: x1, x2
        REAL(KIND = CALC_PRECISION), INTENT(IN) :: a, b, c
        REAL(KIND = CALC_PRECISION) :: era_1, era_2

        era_1 = abs(a * x1 * x1 + b * x1 + c)
        era_2 = abs(a * x2 * x2 + b * x2 + c)

        IF (era_1 .LT. eps_2p .AND. era_2 .LT. eps_2p) THEN
            WRITE(*,*) "Rezultat corect!"
        ELSE
            WRITE(*,*) "Rezultat incorect!"
        END IF
    END SUBROUTINE verif_rad_c
END MODULE L2_Utils

PROGRAM main
    USE L2_Utils
    IMPLICIT NONE

    REAL(KIND = CALC_PRECISION)    :: a, b, c, x1, x2, delta, s_delta, a_delta, img, r
    COMPLEX(KIND = CALC_PRECISION) :: x1c, x2c

    CALL get_input()

    IF (a .EQ. 0) THEN
        IF (b .EQ. 0) THEN
            IF (c .EQ. 0) THEN
                WRITE(*,*) "R: inf"
            ELSE 
                WRITE(*,*) "Ecuatia este imposibila"
            END IF
        ELSE
            WRITE(*,*) "Ecuatie de gradul 1:"

            x1 = -c / b

            WRITE(*,*) "x1 = ", x1

            CALL verif_rad(a, b, c, x1)
        END IF
    ELSE
        WRITE(*,*) "Ecuatie de gradul 2:"

        delta = b * b - 4 * a * c

        IF (delta .GT. 0) THEN
            WRITE(*,*) "Ecuatia are 2 solutii reale:"

            s_delta = sqrt(delta)
            x1 = (-b - s_delta) / (2 * a)
            x2 = (-b + s_delta) / (2 * a)

            WRITE(*,*) "x1 = ", x1, "x2 = ", x2

            CALL verif_rad(a, b, c, x1, x2)
        ELSE IF (delta .EQ. 0) THEN

            x1 = -b / (2 * a);
            x2 = -b / (2 * a);

            WRITE(*,*) "x1 = x2 = ", x1

            CALL verif_rad(a, b, c, x1)
        ELSE
            WRITE(*,*) "Ecuatia are 2 solutii complexe:"

            a_delta = -delta
            s_delta = sqrt(a_delta)
            img = s_delta / (2 * a)
            r = -b / (2 * a)
            
            x1c = CMPLX(r, -img, KIND = CALC_PRECISION)
            x2c = CMPLX(r, img,  KIND = CALC_PRECISION)

            WRITE(*,*) "x1c = ", x1c, "x2c = ", x2c

            CALL verif_rad(a, b, c, x1c, x2c)
        END IF
    END IF

CONTAINS
    SUBROUTINE get_input
        IMPLICIT NONE

        WRITE(*,*) 
		WRITE(*,*) "Coeficientii ecuatiei:"

        WRITE(*, '(A)', ADVANCE='NO') " a = "
        READ(*,*) a

        WRITE(*, '(A)', ADVANCE='NO') " b = "
        READ(*,*) b
        
        WRITE(*, '(A)', ADVANCE='NO') " c = "
        READ(*,*) c
    END SUBROUTINE get_input
END PROGRAM main