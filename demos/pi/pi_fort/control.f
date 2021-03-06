	PROGRAM CONTROL

	INTEGER WORKERS, INTERVALS
	DOUBLE	PRECISION TOTAL

	WORKERS = 0
	CALL POS_WRITE( 5, WORKERS, 4)
	CALL POS_READ(  4, WORKERS, 4)

	WRITE(*, 10) WORKERS
10	FORMAT (' Pi controller : the number of workers is ', I4 )

	CALL POS_WRITE( 5, WORKERS, 4)
	CALL POS_READ(  4, WORKERS, 4)

	WRITE(*, 20)
20	FORMAT (' Please enter the number of intervals per worker : ')

	READ(*, *) INTERVALS

	CALL POS_WRITE( 5, INTERVALS, 4)
	CALL POS_READ(  4, INTERVALS, 4)

	TOTAL = 0.0
	CALL POS_WRITE( 5, TOTAL, 8)
	CALL POS_READ(  4, TOTAL, 8)

	WRITE(*,30) TOTAL
30	FORMAT (' Calculated value of pi is ', F16.14)

	END
