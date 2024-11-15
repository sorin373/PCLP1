PROGRAM main
    IMPLICIT NONE

        INTEGER*8 :: n

        WRITE(*, '(A)', ADVANCE='NO') "n = "
        READ(*,*) n
        
        WRITE(*,*) "Prime: ", is_prime(n)
        WRITE(*,*) "Perfect: ", is_perfect(n)
        
    CONTAINS

    FUNCTION is_prime(n) RESULT(retval)
        IMPLICIT NONE

        INTEGER*8, INTENT(IN) :: n
        LOGICAL :: retval

        INTEGER*8 :: d

        IF (n .LE. 1) THEN
            retval = .FALSE.
            RETURN
        END IF

        DO d = 2, n / 2
            IF (MOD(n, d) .EQ. 0) THEN
                retval = .FALSE.
                RETURN
            END IF
        END DO

        retval = .TRUE.
    END FUNCTION is_prime

    FUNCTION is_perfect(n) RESULT(retval)
        IMPLICIT NONE

        INTEGER*8, INTENT(IN) :: n
        LOGICAL :: retval

        INTEGER*8 :: sum, d

        sum = 1

        DO d = 2, n / 2
            IF (MOD(n, d) .EQ. 0) THEN
                sum = sum + d
            END IF
        END DO

        IF (sum .EQ. n) THEN
            retval = .TRUE.
            RETURN
        END IF

        retval = .FALSE.
    END FUNCTION is_perfect
END PROGRAM main