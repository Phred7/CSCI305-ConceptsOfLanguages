	program StripDuplicates(string)
	implicit none
	
	character(LEN = *) :: string
	integer :: stringLen
	integer :: last, actual
	
	stringLen = len (string)
	last = 1
	actual = 1

	do while (actual < stringLen)
		if (string(last:actual) == ' ') then
			actual = actual + 1
			string(last:last) = string(actual:actual)
			string(actual:actual) = ' '
		else
			last = last + 1
			if (actual < last) then
				actual = last
			endif
		endif
	end do
	
	end program StripDuplicates