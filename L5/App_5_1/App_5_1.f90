PROGRAM main
    IMPLICIT NONE

    INTEGER, DIMENSION(:,:), ALLOCATABLE :: m
    INTEGER :: n, i, j, s, cnt

    WRITE(*, '(A)', ADVANCE='NO') "n = "
    READ(*,*) n

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
            WRITE(*, "(1000I2)") m(i, 1:n)
        END DO

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