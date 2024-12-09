!
! PCLP1 | L5
!   Realizați un program care citește un vector de numere intregi dintr-un fisier si il sorteaza crescator folosind
!   metoda MINMAX, il afiseaza pe ecran si il salveaza intr-un fisier. 
!
! File: App_5_2.f90
!

PROGRAM main
    IMPLICIT NONE

    INTEGER, DIMENSION(:), ALLOCATABLE :: v, aux
    INTEGER :: cnt, n, i, j, io_status, x, temp

    OPEN(UNIT=1, FILE='vector.txt', STATUS='old', IOSTAT=io_status)

    IF (io_status .NE. 0) THEN
        WRITE(*,*) "Error opening file."
        STOP
    END IF

    cnt = 0
    n = 0

    DO WHILE (.TRUE.)
        READ(1, *, IOSTAT=io_status) x

        IF (io_status .NE. 0) EXIT

        cnt = cnt + 1

        IF (cnt > n) THEN
            IF (ALLOCATED(aux)) DEALLOCATE(aux)
            
            ALLOCATE(aux(cnt))

            DO i = 1, n
                aux(i) = v(i)
            END DO

            aux(cnt) = x

            IF (ALLOCATED(v)) DEALLOCATE(v)

            v = aux
            n = cnt
        END IF
    END DO

    CLOSE(1)

    DO i = 1, n - 1
        DO j = i + 1, n
            IF (v(i) > v(j)) THEN
                temp = v(i)
                v(i) = v(j)
                v(j) = temp
            END IF
        END DO
    END DO

    DO i = 1, n
        WRITE(*,*) v(i)
    END DO

    DEALLOCATE(v)
END PROGRAM main