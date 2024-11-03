! 
! PCLP1 | L2
!    Determinarea coordonatelor punctului P(r, teta) in coordonate polare
!    
! App_2_2.f90
! 

MODULE L2_Utils
    IMPLICIT NONE

    INTEGER, PARAMETER :: CALC_PRECISION = 8

    REAL, PARAMETER :: eps_2p = 1e-10
    REAL, PARAMETER :: PI = 3.14159265358979323846264338327950288419716939937510

    CONTAINS

    FUNCTION to_degrees(a) RESULT(retval)
        IMPLICIT NONE

        REAL(KIND = CALC_PRECISION), INTENT(IN) :: a
        REAL(KIND = CALC_PRECISION) :: retval

        retval = a * 180 / PI
    END FUNCTION to_degrees

    FUNCTION to_rad(a) RESULT(retval)
        IMPLICIT NONE

        REAL(KIND = CALC_PRECISION), INTENT(IN) :: A
        REAL(KIND = CALC_PRECISION) :: retval

        retval = a * PI / 180
    END FUNCTION to_rad

    SUBROUTINE era(x1, y1)
        IMPLICIT NONE

        REAL(KIND = CALC_PRECISION), INTENT(IN) :: x1, y1

        IF (abs(x1) .LT. eps_2p .AND. abs(y1) .LT. eps_2p) THEN
            WRITE(*,*) "Rezultat corect!"
        ELSE
            WRITE(*,*) "Rezultat incorect!"
        END IF
    END SUBROUTINE era

    SUBROUTINE err(x0, y0, x1, y1)
        IMPLICIT NONE

        REAL(KIND = CALC_PRECISION), INTENT(IN) :: x0, y0, x1, y1
        LOGICAL :: verifX, verifY

        IF (abs(x0) .LT. eps_2p .AND. abs(y0) .LT. eps_2p) THEN
            CALL era(x1, y1)
            RETURN
        END IF

        verifX = ((x0 .NE. 0.0) .AND. (abs((x1 - x0) / x0) < eps_2p)) .OR. ((x0 .EQ. 0.0) .AND. (abs(x1) < eps_2p))
        verifY = ((y0 .NE. 0.0) .AND. (abs((y1 - y0) / y0) < eps_2p)) .OR. ((y0 .EQ. 0.0) .AND. (abs(y1) < eps_2p))
        
        IF (verifX .AND. verifY) THEN
            WRITE(*,*) "Rezultat corect!"
        ELSE
            WRITE(*,*) "Rezultat incorect!"
        END IF
    END SUBROUTINE err
END MODULE L2_Utils

PROGRAM main
    USE L2_Utils
    IMPLICIT NONE
    
    REAL(KIND = CALC_PRECISION) :: x0, y0, r, teta, x1, y1

    WRITE(*,*) 
    WRITE(*,*) "Introduceti coordonatele:"

    WRITE(*, '(A)', ADVANCE='NO') " x0 = "
    READ(*,*) x0

    WRITE(*, '(A)', ADVANCE='NO') " y0 = "
    READ(*,*) y0

    r = sqrt(x0 * x0 + y0 * y0)

    IF (r .EQ. 0) THEN
        WRITE(*,*) "Raza este 0."
        RETURN
    END IF
    
    IF (x0 == 0 .AND. y0 > 0) THEN
        teta = 90.0;
    ELSE IF (x0 == 0 .AND. y0 < 0) THEN
        teta = 270.0;
    ELSE IF (y0 == 0 .AND. x0 > 0) THEN
        teta = 0.0;
    ELSE IF (y0 == 0 .AND. x0 < 0) THEN
        teta = 180.0;
    ELSE
        teta = to_degrees(acos(abs(x0) / r));

        IF (x0 < 0 .AND. y0 > 0) THEN
            teta = 180 - teta; 
        ELSE IF (x0 < 0 .AND. y0 < 0) THEN
            teta = 180 + teta; 
        ELSE IF (x0 > 0 .AND. y0 < 0) THEN
            teta = 360 - teta; 
        END IF
    END IF

    WRITE(*,*)
    WRITE(*,*) "r = ", r, "; teta = ", teta, "[deg]"

    x1 = r * cos(to_rad(teta))
    y1 = r * sin(to_rad(teta))

    WRITE(*,*)
    CALL err(x0, y0, x1, y1)
END PROGRAM main