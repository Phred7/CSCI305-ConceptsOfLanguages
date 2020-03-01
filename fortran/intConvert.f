	program intConvert
	implicit none

	integer :: val
	character(LEN=24) :: stringyString
	character(LEN=12) :: output
	
	val = 41
	stringyString = '+ string'

	WRITE(output,*) val

	WRITE(*,*) output

	stringyString = output // stringyString

	WRITE(*,*) stringyString

	end program intConvert
