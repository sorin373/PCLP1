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

    SUBROUTINE insertion_sort(v, n)
        INTEGER, ALLOCATABLE :: v(:)
        INTEGER :: n, i, j, key

        DO i = 2, n
            key = v(i)
            j = i - 1

            DO WHILE(j >= 1 .AND. v(j) > key)
                v(j + 1) = v(j)
                j = j - 1
            END DO

            v(j + 1) = key
        END DO
    END SUBROUTINE insertion_sort
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

    CALL insertion_sort(v, n)

    DO i = 1, n
        WRITE(*,*) v(i)
    END DO

    DEALLOCATE(v)
    CLOSE(1)
END PROGRAM main