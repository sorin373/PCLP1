!
! PCLP1 | L6
!   Realizați un program care citește un vector de numere intregi dintr-un fisier si il sorteaza crescator folosind
!   metoda SELECT, il afiseaza pe ecran si il salveaza intr-un fisier.  
!
! File: App_6_1.f90
!

MODULE L5
    IMPLICIT NONE

    CONTAINS

    SUBROUTINE resize(v,  old_size, new_size)
        INTEGER, ALLOCATABLE :: v(:)
        INTEGER :: new_size, old_size, i
        INTEGER, ALLOCATABLE :: t_ptr(:)

        ALLOCATE(t_ptr(new_size))

        DO i = 1, old_size
            t_ptr(i) = v(i)
        END DO

        DEALLOCATE(v)
        ALLOCATE(v(new_size))

        v = t_ptr

        DEALLOCATE(t_ptr)
    END SUBROUTINE resize

    SUBROUTINE select_sort(v, n)
        INTEGER, ALLOCATABLE :: v(:)
        INTEGER :: n, i, j, minim, aux

        DO i = 1, n - 1
            minim = i

            DO j = i + 1, n
                IF (v(j) .LT. v(minim)) minim = j 
            END DO

            aux = v(i)
            v(i) = v(minim)
            v(minim) = aux
        END DO
    END SUBROUTINE select_sort
END MODULE L5

PROGRAM main
    USE L5
    IMPLICIT NONE

    INTEGER :: n, cap, x, stat, i
    INTEGER, ALLOCATABLE :: v(:)

    n = 0
    cap = 0

    OPEN(1, FILE="file.in", ACTION="read")

    ALLOCATE(v(0))

    DO
        READ(1, *, IOSTAT=stat) x
        
        IF (stat .NE. 0) EXIT

        IF (n >= cap) THEN
            cap = n * 2 + 1
            CALL resize(v, n, cap)
        END IF

        v(n + 1) = x
        n = n + 1
    END DO

    CALL select_sort(v, n)

    DO i = 1, n
        WRITE(*,*) v(i)
    END DO

    DEALLOCATE(v)
    CLOSE(1)
END PROGRAM main