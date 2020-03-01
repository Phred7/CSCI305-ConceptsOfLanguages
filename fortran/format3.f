	program format3
	implicit none
	
	integer :: i
	character(LEN=2) :: output
	character(LEN=6) :: formatF
	
	i = 88
	
	formatF = "(i2)"
	
	WRITE(output,formatF) i
	
	WRITE(*,*) '~', output, '~'
	
	end program format3