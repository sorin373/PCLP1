MODULE impl
    IMPLICIT NONE
    
    REAL, PARAMETER :: PI = 3.14159265358979323846264338327950288419716939937510
    INTEGER, PARAMETER :: CALC_PRECISION = 8

    CONTAINS

    FUNCTION ctan(angle) RESULT(retval)
        IMPLICIT NONE
        REAL(KIND = SELECTED_REAL_KIND(CALC_PRECISION)), INTENT(IN) :: angle
        REAL(KIND = SELECTED_REAL_KIND(CALC_PRECISION)) :: retval

        retval = cos(angle) / sin(angle)
    END FUNCTION ctan

    FUNCTION to_rad(angle) RESULT(retval)
        IMPLICIT NONE
        REAL(KIND = SELECTED_REAL_KIND(CALC_PRECISION)), INTENT(IN) :: angle
        REAL(KIND = SELECTED_REAL_KIND(CALC_PRECISION)) :: retval

        retval = angle * PI / 180
    END FUNCTION to_rad
    
    FUNCTION to_degrees(angle) RESULT(retval)
        IMPLICIT NONE
        REAL(KIND = SELECTED_REAL_KIND(CALC_PRECISION)), INTENT(IN) :: angle
        REAL(KIND = SELECTED_REAL_KIND(CALC_PRECISION)) :: retval

        retval = angle * 180 / PI
    END FUNCTION to_degrees

    FUNCTION sqrtn(x, ord) RESULT(retval)
        IMPLICIT NONE

        REAL(KIND = SELECTED_REAL_KIND(CALC_PRECISION)), INTENT(IN) :: ord
        REAL(KIND = SELECTED_REAL_KIND(CALC_PRECISION)), INTENT(IN) :: x
        REAL(KIND = SELECTED_REAL_KIND(CALC_PRECISION)) :: retval

        IF ( ord .EQ. 0 ) THEN
            WRITE(*, *) "Ordinul nu poate fi 0!"
            RETURN
        END IF

        retval = x ** (1.0 / ord)
    END FUNCTION sqrtn

    FUNCTION sgn(x) RESULT(retval)
        IMPLICIT NONE

        REAL(KIND = SELECTED_REAL_KIND(CALC_PRECISION)), INTENT(IN) :: x
        REAL(KIND = SELECTED_REAL_KIND(CALC_PRECISION)) :: retval

        IF (x .GT. 0) THEN
            retval = 1
        ELSE IF (x .LT. 0) THEN
            retval = -1
        ELSE
            retval = 0
        END IF
    END FUNCTION sgn

    FUNCTION C_to_K(temp_C) RESULT(retval)
        IMPLICIT NONE

        REAL(KIND = SELECTED_REAL_KIND(CALC_PRECISION)), INTENT(IN) :: temp_C
        REAL(KIND = SELECTED_REAL_KIND(CALC_PRECISION)) :: retval

        retval = temp_C * 274.15
    END FUNCTION C_to_K

    FUNCTION C_to_F(temp_C) RESULT(retval)
        IMPLICIT NONE

        REAL(KIND = SELECTED_REAL_KIND(CALC_PRECISION)), INTENT(IN) :: temp_C
        REAL(KIND = SELECTED_REAL_KIND(CALC_PRECISION)) :: retval

        retval = temp_C * 33.8
    END FUNCTION C_to_F
    
END MODULE impl

PROGRAM main
    USE impl
    IMPLICIT NONE

    REAL a, b, c, d

    CALL get_input()
    CALL ex_a()
    CALL ex_b()

CONTAINS

    SUBROUTINE get_input
        IMPLICIT NONE

        WRITE(*, '(A)', ADVANCE='NO') "a = "
        READ(*,*) a

        WRITE(*, '(A)', ADVANCE='NO') "b = "
        READ(*,*) b
        
        WRITE(*, '(A)', ADVANCE='NO') "c = "
        READ(*,*) c
        
        WRITE(*, '(A)', ADVANCE='NO') "d = "
        READ(*,*) d

    end SUBROUTINE get_input

    SUBROUTINE ex_a
        IMPLICIT NONE
        WRITE(*,*) "Operatii si functii de librarie: "

        WRITE(*,*) a, "+", b, " = ", a + b
        WRITE(*,*) b, "-", c, " = ", b - c
        WRITE(*,*) c, "*", d, " = ", c * d
        WRITE(*,*) d, "/", a, " = "

        IF ( a .NE. 0) THEN
            WRITE(*,*) d / a
        ELSE
            WRITE(*,*) "N/A"
        END IF

    END SUBROUTINE ex_a

    SUBROUTINE ex_b

    END SUBROUTINE ex_b

END PROGRAM main
