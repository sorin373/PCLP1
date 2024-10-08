! PCLP - L1 - f90 

MODULE impl
    IMPLICIT NONE
    
    REAL, PARAMETER :: PI = 3.14159265358979323846264338327950288419716939937510_8
	REAL, PARAMETER :: F = 10000.0_8 ! val. forta in ex_b
	REAL, PARAMETER :: g = 9.80_8    ! val. const. acceleratie gravitationala
	
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

        IF (ord .EQ. 0) THEN
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

    REAL(KIND = SELECTED_REAL_KIND(CALC_PRECISION)) :: a = 0.0, b = 0.0, c = 0.0, d = 0.0

    CALL get_input()
    CALL ex_a()
    CALL ex_b()

CONTAINS
    SUBROUTINE get_input
        IMPLICIT NONE
		
		WRITE(*,*) "-- USER_INPUT: "

        WRITE(*, '(A)', ADVANCE='NO') "a = "
        READ(*,*) a

        WRITE(*, '(A)', ADVANCE='NO') "b = "
        READ(*,*) b
        
        WRITE(*, '(A)', ADVANCE='NO') "c = "
        READ(*,*) c
        
        WRITE(*, '(A)', ADVANCE='NO') "d = "
        READ(*,*) d

    END SUBROUTINE get_input

    SUBROUTINE ex_a
		USE, INTRINSIC :: ISO_FORTRAN_ENV  
        IMPLICIT NONE
		
        WRITE(*,*) "-- Operatii si functii de librarie: "

        WRITE(*,*) "a + b = ", a + b
        WRITE(*,*) "b - c = ", b - c
        WRITE(*,*) "c * d = ", c * d
        
        IF (a .NE. 0) THEN
            WRITE(*,*) "d / a = ", d / a
        ELSE
            WRITE(*,*) "d / a = N/A"
        END IF
		
		WRITE(*,*) "sin(a) = ",  sin(a)
		WRITE(*,*) "sin(a) = ",  sin(to_rad(a))
		WRITE(*,*) "cos(b) = ",	 cos(b)
		WRITE(*,*) "tan(c) = ",  tan(c)
		WRITE(*,*) "ctan(d) = ", ctan(d)
		WRITE(*,*) "asin(a) = ", to_degrees(asin(a))
		WRITE(*,*) "acos(a) = ", to_degrees(acos(a))
		WRITE(*,*) "atan(d) = ", atan(d)
		
		IF (c .NE. 0) THEN
			WRITE(*,*) "atan(d / c) = ", atan(d / c)
		ELSE
			WRITE(*,*) "atan(d / c) = N/A"
		END IF
		
		WRITE(*,*) "atan2(d, c) = ", to_degrees(atan2(d, c))
		
		IF (c .NE. 0) THEN
			WRITE(*,*) "atan(-d / -c) = ", to_degrees(atan((-d) / (-c)))
		ELSE
			WRITE(*,*) "atan(-d / -c) = N/A"
		END IF
		
		WRITE(*,*) "atan2(-d, -c) = ", to_degrees(atan2((-d), (-c)))
		
		IF (a .GT. 0) THEN 
			WRITE(*,*) "ln(a) = ", log(a)
		ELSE
			WRITE(*,*) "ln(a) = N/A"
		END IF
		
		IF (b .GT. 0) THEN
			WRITE(*,*) "lg(b) = ", log10(b)
		ELSE
			WRITE(*,*) "lg(b) = N/A"
		END IF
		
		WRITE(*,*) "pow(e, a) = ", exp(a)
		
		IF (a .LT. 0) THEN
			a = -a
			WRITE(*,*) "sqrt(a) = ", sqrt(a), "i"
		ELSE
			WRITE(*,*) "sqrt(a) = ", sqrt(a)
		END IF
		
		WRITE(*,*) "cube root(d) = ",                  sqrtn(d, 3.0_8)
		WRITE(*,*) "sqrt(pow(c, 2) + pow(d, 2)) = ",   sqrt(c ** 2 + d ** 2)
		WRITE(*,*) "sgn(b) = ",     				   sgn(b)
		WRITE(*,*) "abs(c) = ",    					   abs(c)
		WRITE(*,*) "abs(-c) = ",   					   abs(-c)
		WRITE(*,*) "ceil(-c) = ",  					   ceiling(-c)
		WRITE(*,*) "floor(-c) = ", 					   floor(-c)
		WRITE(*,*) "round(-c) = ", 					   nint(-c) ! round() only available in Fortran 2008
		WRITE(*,*) "pow(a, b) = ", 					   a ** b	
    END SUBROUTINE ex_a

    SUBROUTINE ex_b
		IMPLICIT NONE
		
		REAL(KIND = SELECTED_REAL_KIND(CALC_PRECISION)) :: arie_patrat = 0.0, arie_dreptunghi = 0.0
		REAL(KIND = SELECTED_REAL_KIND(CALC_PRECISION)) :: arie_cerc = 0.0, arie_triunghi_drept = 0.0
		
		WRITE(*,*) "-- Expresii matematice: "
		
		arie_patrat          = a * a
		arie_dreptunghi  	 = c * d
		arie_cerc 			 = PI * b * b
		arie_triunghi_drept  = a * d / 2
		
		WRITE(*,*) "d(P1, P2) = ", sqrt((b - a) ** 2 + (d - b) ** 2)
		
		WRITE(*,*) "a. Arie patrat = ", 	      arie_patrat,      "mm^2"
		WRITE(*,*) "b. Arie dreptunghi = ",       arie_dreptunghi,  "mm^2"
		WRITE(*,*) "c. Arie cerc = ", 			  arie_cerc
		WRITE(*,*) "d. Arie triunghi drept. = ",  arie_dreptunghi,  "mm^2"
		
		WRITE(*,*) "a. P patrat = ", 		   F / arie_patrat, 		 "N / m^2"
		WRITE(*,*) "b. P dreptunghi = ", 	   F / arie_dreptunghi,		 "N / m^2"
		WRITE(*,*) "c. P cerc = ", 			   F / arie_cerc, 			 "N / m^2"
		WRITE(*,*) "d. P triunghi drept. = ",  F / arie_triunghi_drept,  "N / m^2"
		
		WRITE(*,*) "T = ",    C_to_K(a), "K", C_to_F(a), "F"
		WRITE(*,*) "LGx = ",  a * g * b / 1000 * cos(to_rad(1.0_8))
    END SUBROUTINE ex_b
END PROGRAM main