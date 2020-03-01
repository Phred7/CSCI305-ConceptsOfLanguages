	program time
	implicit none

	Character(LEN = 8) :: DateINFO
	Character(LEN = 4) :: Year, Month*2, Day*2
	Character(LEN = 10) :: TimeINFO, PrettyTime*12, PrettyDate*12
	Character(LEN = 2) :: Hour, Minute, Second*6
	Character(LEN = 12) :: DayTimeConcat*20

	call date_and_time(DateINFO, TimeINFO)

	Year = DateINFO(1:4)
	Month = DateINFO(5:6)
	Day = DateINFO(7:8)

	Hour = TimeINFO(1:2)
	Minute = TimeINFO(3:4)
	Second = TimeINFO(5:10)


	PrettyDate = Month // '-' // Day // '-' // Year
	PrettyTime = Hour // ':' // Minute

	DayTimeConcat = PrettyDate // ', ' // PrettyTime

	call StripSpaces(DayTimeConcat)

	!WRITE(*,*) PrettyDate, PrettyTime, DayTimeConcat
	WRITE(*,*) DayTimeConcat

	end program time

	!subroutine courtest of Jauch - StackOverflow	
	subroutine StripSpaces(string)
	implicit none
	
	character(len=*) :: string
	integer :: stringLen
	integer :: last, actual

	stringLen = len (string)
	last = 1
	actual = 1

	do while (actual < stringLen)
		if (string(last:last) == ' ') then
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
	
	end subroutine
