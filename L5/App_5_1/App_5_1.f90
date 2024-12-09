!
! PCLP1 | L5
!   - Construiti, afisati si salvati intr-un fisier o matrice pătratică cu n linii și n coloane (matricea trebuie alocata dinamic) 
!   - Calculati suma s elementelor de index par (elementele matricei se indexeaza/linearizeaza dupa coloane) 
!
! File: App_5_1.f90
!

PROGRAM main
    IMPLICIT NONE

    INTEGER, DIMENSION(:,:), ALLOCATABLE :: m
    INTEGER :: n, i, j, s, cnt

    WRITE(*, '(A)', ADVANCE='NO') "n = "
    READ(*,*) n

    OPEN(UNIT=1, FILE='matrice.out', STATUS='old') 

    ALLOCATE(m(n,n))

    IF (ALLOCATED(m)) THEN 
        DO i = 1, n
            DO j = 1, n
                IF ((i .EQ. j) .OR. (j .EQ. n - i + 1) .OR. (j .EQ. (n + 1) / 2) .OR. (i .EQ. (n + 1) / 2)) THEN
                    m(i, j) = 0
                ELSE
                    m(i, j) = 1
                END IF
            END DO
        END DO

        DO i = 1, n
            WRITE(1, "(1000I2)") m(i, 1:n)
        END DO

        CLOSE(1)

        s = 0
        cnt = 1

        DO i = 1, n
            DO j = 1, n
                IF (MOD(cnt, 2) .EQ. 0) THEN
                    s = s + m(j, i)
                END IF

                cnt = cnt + 1
            END DO
        END DO

        WRITE(*,*) "s = ", s

        DEALLOCATE(m)
    ELSE
        WRITE(*,*) "Memory allocation failed"
    END IF
END PROGRAM main