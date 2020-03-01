	program debug
	implicit none
	
	integer :: cents, a=1, i=1, LU, LO, LI, PO
	character(LEN=2) :: prettyPrint = "", FRMT*6
	
	integer :: lenLU, LU2
	
	


	cents = 88
	LU2 = 2
	LU = cents/30
	cents = cents -LU
	
		
	IF(LU>0) then
		FRMT = "(i1,a)"
		write(*,*) '~', LU, '~'
		write(*, FRMT, advance="no") LU, prettyPrint
		prettyPrint = adjustr(prettyPrint)
		write(*,*) prettyPrint // " Lunkers"
	end if
	
	prettyPrint = ""
	
	IF(LU2>0) then
		FRMT = "(i1,a)"
		write(*,*) '~', LU2, '~'
		write(*, FRMT, advance="no") LU2, ' Lunkers '
		write(*, FRMT, advance="no") LU2, ' Lunkers2'
	end if

	LO = cents/15
	cents = cents - LO
	LI = cents/5
	PO = cents - LI

	end program debug
