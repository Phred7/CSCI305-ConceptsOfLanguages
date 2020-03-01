	!program courtesy of M.S.B. - StackOVerFlow
	program TestRead
	implicit none

	integer :: number, ReadStatus

	write (*, '( "Input integer: " )', advance="no" )
	ReadInt: do
		read (*, *, iostat=ReadStatus) number
		if ((ReadStatus == 0) .AND. (number > 0) .AND. (number < 99)) then
			exit ReadInt
		else
			write (*, '( / "READ ERROR: please re-input:" )' )
		end if
	end do ReadInt

	write (*, '( / "Value read: ", I0 )' )  number

	end program TestRead
