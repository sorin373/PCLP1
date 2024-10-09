!
! PCLP | L1
! Folosirea functiilor matematice si de formatare ( ISO_FORTRAN_ENV )
!
! File: App_1_2.f90
!

MODULE L1_Utils
    IMPLICIT NONE
    
    REAL, PARAMETER :: PI = 3.14159265358979323846264338327950288419716939937510_8
	REAL, PARAMETER :: F = 10000.0_8
	REAL, PARAMETER :: g = 9.80_8
	
    INTEGER, PARAMETER :: CALC_PRECISION = 8

    CONTAINS

    FUNCTION ctan(angle) RESULT(retval)
        IMPLICIT NONE
        REAL(KIND = CALC_PRECISION), INTENT(IN) :: angle
        REAL(KIND = CALC_PRECISION) :: retval, sin_f

        sin_f = sin(angle)

        IF (sin_f .EQ. 0) THEN
            WRITE(*, *) "Division by 0!"
            RETURN
        END IF

        retval = cos(angle) / sin_f
    END FUNCTION ctan

    FUNCTION to_rad(angle) RESULT(retval)
        IMPLICIT NONE
        REAL(KIND = CALC_PRECISION), INTENT(IN) :: angle
        REAL(KIND = CALC_PRECISION) :: retval

        retval = angle * PI / 180
    END FUNCTION to_rad
    
    FUNCTION to_degrees(angle) RESULT(retval)
        IMPLICIT NONE
        REAL(KIND = CALC_PRECISION), INTENT(IN) :: angle
        REAL(KIND = CALC_PRECISION) :: retval

        retval = angle * 180 / PI
    END FUNCTION to_degrees

    FUNCTION sqrtn(x, ord) RESULT(retval)
        IMPLICIT NONE

        REAL(KIND = CALC_PRECISION), INTENT(IN) :: ord
        REAL(KIND = CALC_PRECISION), INTENT(IN) :: x
        REAL(KIND = CALC_PRECISION) :: retval

        IF (ord .EQ. 0) THEN
            WRITE(*, *) "Ordinul nu poate fi 0!"
            RETURN
        END IF

        retval = x ** (1.0 / ord)
    END FUNCTION sqrtn

    FUNCTION sgn(x) RESULT(retval)
        IMPLICIT NONE

        REAL(KIND = CALC_PRECISION), INTENT(IN) :: x
        REAL(KIND = CALC_PRECISION) :: retval

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

        REAL(KIND = CALC_PRECISION), INTENT(IN) :: temp_C
        REAL(KIND = CALC_PRECISION) :: retval

        retval = temp_C * 274.15
    END FUNCTION C_to_K

    FUNCTION C_to_F(temp_C) RESULT(retval)
        IMPLICIT NONE

        REAL(KIND = CALC_PRECISION), INTENT(IN) :: temp_C
        REAL(KIND = CALC_PRECISION) :: retval

        retval = temp_C * 33.8
    END FUNCTION C_to_F
END MODULE L1_Utils

PROGRAM main
    USE L1_Utils
    IMPLICIT NONE

    REAL(KIND = CALC_PRECISION) :: a = 0.0, b = 0.0, c = 0.0, d = 0.0, r = 0.0

    CALL get_input()
    CALL ex_a()
    CALL ex_b()

CONTAINS
    SUBROUTINE get_input
        IMPLICIT NONE
		
        WRITE(*,*) 
		WRITE(*,*) "-- USER_INPUT: "

        WRITE(*, '(A)', ADVANCE='NO') " a = "
        READ(*,*) a

        WRITE(*, '(A)', ADVANCE='NO') " b = "
        READ(*,*) b
        
        WRITE(*, '(A)', ADVANCE='NO') " c = "
        READ(*,*) c
        
        WRITE(*, '(A)', ADVANCE='NO') " d = "
        READ(*,*) d

    END SUBROUTINE get_input

    SUBROUTINE ex_a
		USE, INTRINSIC :: ISO_FORTRAN_ENV  
        IMPLICIT NONE
        
        WRITE(*,*) 
        WRITE(*,*) "-- Operatii si functii de librarie: "
        WRITE(*,*) 
        
        r = a + b
        WRITE(*,*) "[1]: a + b = ", r

        r = b - c
        WRITE(*,*) "[2]: b - c = ", r

        r = c * d
        WRITE(*,*) "[3]: c * d = ", r
        
        IF (a .NE. 0) THEN
            r = d / a
            WRITE(*,*) "[4]: d / a = ", r
        ELSE
            WRITE(*,*) "[4]: d / a = N/A"
        END IF
		
        r = sin(a)
		WRITE(*,*) "[5]: sin(a) = ", r
        
        r = sin(to_rad(a))
		WRITE(*,*) "[6]: sin(a) = ", r

        r = cos(b)
		WRITE(*,*) "[7]: cos(b) = ",	r

        r = tan(c)
		WRITE(*,*) "[8]: tan(c) = ", r

        r = ctan(d)
		WRITE(*,*) "[9]: ctan(d) = ", r

        r = to_degrees(asin(a))
		WRITE(*,*) "[10]: asin(a) = ", r, " [deg]"

        r = to_degrees(acos(a))
		WRITE(*,*) "[11]: acos(a) = ", r, " [deg]"
		
		IF (c .NE. 0) THEN
            r = to_degrees(atan(d / c))
			WRITE(*,*) "[12]: atan(d / c) = ", r, " [deg]"
		ELSE
			WRITE(*,*) "[12]: atan(d / c) = N/A"
		END IF
		
        r = atan2(d, c)
		WRITE(*,*) "[13]: atan2(d, c) = ", r
		
		IF (c .NE. 0) THEN
            r = to_degrees(atan((-d) / (-c)))
			WRITE(*,*) "[14]: atan(-d / -c) = ", r
		ELSE
			WRITE(*,*) "[14]: atan(-d / -c) = N/A"
		END IF
		
        r = atan2((-d), (-c))
		WRITE(*,*) "[15]: atan2(-d, -c) = ", r
		
		IF (a .GT. 0) THEN 
            r = log(a)
			WRITE(*,*) "[16]: ln(a) = ", r
		ELSE
			WRITE(*,*) "[16]: ln(a) = N/A"
		END IF
		
		IF (b .GT. 0) THEN
            r = log10(b)
			WRITE(*,*) "[17]: lg(b) = ", r
		ELSE
			WRITE(*,*) "[17]: lg(b) = N/A"
		END IF
		
        r = exp(a)
		WRITE(*,*) "[18]: pow(e, a) = ", r
		
		IF (a .LT. 0) THEN
			a = -a
            r = sqrt(a)
			WRITE(*,*) "[19]: sqrt(a) = ", r, "i"
		ELSE
            r = sqrt(a)
			WRITE(*,*) "[19]: sqrt(a) = ", r
		END IF
		
        r = sqrtn(d, 3.0_8)
		WRITE(*,*) "[20]: cube root(d) = ", r

        r = sqrt(c ** 2 + d ** 2)
		WRITE(*,*) "[21]: sqrt(pow(c, 2) + pow(d, 2)) = ", r
        
        r = sgn(b)
		WRITE(*,*) "[22]: sgn(b) = ", r  	
        
        r = abs(c)
		WRITE(*,*) "[23]: abs(c) = ", r

        r = abs(-c)
		WRITE(*,*) "[24]: abs(-c) = ", r

        r = ceiling(-c)
		WRITE(*,*) "[25]: ceil(-c) = ", r

        r = floor(-c)
		WRITE(*,*) "[26]: floor(-c) = ", r
        
        r = nint(-c)
		WRITE(*,*) "[27]: round(-c) = ", r ! nint() = round()

        r = a ** b
		WRITE(*,*) "[28]: pow(a, b) = ", r
    END SUBROUTINE ex_a

    SUBROUTINE ex_b
		IMPLICIT NONE
		
		REAL(KIND = CALC_PRECISION) :: arie_patrat = 0.0, arie_dreptunghi = 0.0
		REAL(KIND = CALC_PRECISION) :: arie_cerc = 0.0, arie_triunghi_drept = 0.0
		
        WRITE(*,*) 
		WRITE(*,*) "-- Expresii matematice: "
        WRITE(*,*) 
		
        r = sqrt((b - a) ** 2 + (d - b) ** 2)
		WRITE(*,*) "[29]: d(P1, P2) = ", r

        arie_patrat          = a * a
		arie_dreptunghi  	 = c * d
		arie_cerc 			 = PI * b * b
		arie_triunghi_drept  = a * d / 2
		
		WRITE(*,*) "[30]: a. Arie patrat = ", 	        arie_patrat,          "mm^2"
		WRITE(*,*) "      b. Arie dreptunghi = ",       arie_dreptunghi,      "mm^2"
		WRITE(*,*) "      c. Arie cerc = ", 			arie_cerc
		WRITE(*,*) "      d. Arie triunghi drept. = ",  arie_triunghi_drept,  "mm^2"

        r = F / arie_patrat
		WRITE(*,*) "[31]: a. P patrat = ", r, "N / m^2"

        r = F / arie_dreptunghi
		WRITE(*,*) "      b. P dreptunghi = ", r, "N / m^2"

        r = F / arie_cerc
		WRITE(*,*) "      c. P cerc = ", r, "N / m^2"

        r = F / arie_triunghi_drept
		WRITE(*,*) "      d. P triunghi drept. = ", r,  "N / m^2"
        
        r = C_to_K(a)
        WRITE(*, "(A, F6.2, A)", ADVANCE='NO') " [32]: T = ", r, " K = "

        r = C_to_F(a)
        WRITE(*,*) r, "F"
        
        r = a * g * b / 1000 * sin(to_rad(c)) * cos(to_rad(1.0_8))
		WRITE(*,*) "[33]: LGx = ", r
    END SUBROUTINE ex_b
END PROGRAM main