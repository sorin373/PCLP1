PROGRAM main
    IMPLICIT NONE

    TYPE Point
        REAL*8 :: x, y
    END TYPE Point

    TYPE (Point) :: A, B, C
    REAL*8 :: delta, AB, AC, BC, area

    WRITE(*, '(A)', ADVANCE='NO') "A = "
    READ(*,*) A%x, A%y

    WRITE(*, '(A)', ADVANCE='NO') "B = "
    READ(*,*) B%x, B%y

    WRITE(*, '(A)', ADVANCE='NO') "C = "
    READ(*,*) C%x, C%y

    delta = abs(A%x * B%y + B%x * C%y + C%x * A%y - C%x * B%y - B%x * A%y - A%x * C%y);

    IF (delta .NE. 0) THEN
        WRITE(*,*) "Punctele formeaza un triunghi!"

        AB = sqrt((B%x - A%x) * (B%x - A%x) + (B%y - A%y) * (B%y - A%y))
        AC = sqrt((C%x - A%x) * (C%x - A%x) + (C%y - A%y) * (C%y - A%y))
        BC = sqrt((C%x - B%x) * (C%x - B%x) + (C%y - B%y) * (C%y - B%y))

        IF ((AB .EQ. AC) .AND. (AC .EQ. BC)) THEN
            WRITE(*,*) "Triunghi echilateral!"
        ELSE IF ((AB .EQ. AC) .OR. (AC .EQ. BC) .OR. (AB .EQ. BC)) THEN
            WRITE(*,*) "Triunghi isoscel!"
        END IF
        
        area = delta / 2;

        IF (area .EQ. AB * AC / 2 .OR. area .EQ. AB * BC / 2 .OR. area .EQ. AC * BC / 2) THEN
            WRITE(*,*) "Triunghi dreptunghic!"
        END IF

        WRITE(*,*) "area = ", area
    ELSE
        WRITE(*,*) "Punctele sunt coliniare!"
    END IF
END PROGRAM main