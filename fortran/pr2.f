	program main2
	implicit none
	integer input, bool

	bool = 1
	input = 51

	call time

	do while (bool /= 0)	
		WRITE (*,*) 'Enter value to convert to Lonney currency:'
		call userInput(input)
		IF (input > 99) THEN
			WRITE (*,*) 'invalid entry'
		ELSE IF (input < 0) THEN
			WRITE (*,*) 'invalid entry'
		ELSE
			bool = 0
		END IF
	end do

	call convert(input)

	end program main2





	subroutine convert(valueIn)
	implicit none
	
	integer :: valueIn
	integer :: luC, loC, liC, pC
	integer :: lu, lo, li, p
	integer :: lenS

	character(LEN = 1) :: space
	character(LEN = 2) :: sPar1, sPar2, sCom
	character(LEN = 6) :: formatF2
	character(LEN = 7) :: sLo, sLu, sLi, sP
	character(LEN = 8) :: sLoS, sLuS, sLiS, sPS
	character(LEN = 11) :: formatF


	formatF = "(i1, a, a1)"
	formatF2 = "(a1)"

	lu = 30
	lo = 15
	li = 5
	p = 1

	sLu = ' Lunker '
	sLuS = ' Lunkers '
	sLo = ' Looner '
	sLoS = ' Looners '
	sLi = ' Little '
	sLiS = ' Littles '
	sP = ' Pooney '
	sPS = ' Poonies '

	space = ""


	call numCoins(valueIn, lu, luC)
	call numCoins(valueIn, lo, loC)
	call numCoins(valueIn, li, liC)
	call numCoins(valueIn, p, pC)
	
	if(luC == 1) then
		WRITE(*, formatF, advance = 'no') luC, sLu, space
	else if(luC > 0) then
		WRITE(*, formatF, advance = 'no') luC, sLuS, space
	else
		!WRITE(*, formatF2, advance = 'no') space
	end if
	
	if(loC == 1) then
		WRITE(*, formatF, advance = 'no') loC, sLo, space
	else if(loC > 0) then
		WRITE(*, formatF, advance = 'no') loC, sLoS, space
	else
		!WRITE(*, formatF2, advance = 'no') space
	end if
	
	if(liC == 1) then
		WRITE(*, formatF, advance = 'no') liC, sLi, space
	else if(liC > 0) then
		WRITE(*, formatF, advance = 'no') liC, sLiS, space
	else
		!WRITE(*, formatF2, advance = 'no') space
	end if
	
	if(pC == 1) then
		WRITE(*, formatF, advance = 'no') pC, sP, space
	else if(pC > 0) then
		WRITE(*, formatF, advance = 'no') pC, sPS, space
	else
		!WRITE(*, formatF2, advance = 'no') space
	end if
	
	WRITE(*,*)

	end subroutine convert





	subroutine int2String(input, string)
	implicit none

	integer :: input
	character(LEN=30) :: string
	character(LEN=12) :: output
	
	WRITE (output,*) input

	call StripSpaces(output)
	call StripSpaces(string)

	string = output // string

	end subroutine int2String






	subroutine numCoins(remainingInput, coinValue, num)
	implicit none

	integer :: remainingInput, coinValue, num

	if(remainingInput/coinValue > 0) then
		num = remainingInput/coinValue
		remainingInput = remainingInput - (num*coinValue)
		return
	else
		num = 0
		return
	end if

	end subroutine numCoins





	subroutine userInput(value)
	implicit none

	integer:: input, value

	Read (*,*) input

	value = input

	end subroutine userInput





	subroutine time
	implicit none

	Character(LEN = 8) :: DateINFO
	Character(LEN = 4) :: Year, Month*2, Day*2
	Character(LEN = 10) :: TimeINFO, PrettyTime*12, PrettyDate*12
	Character(LEN = 2) :: HOur, Minute, Second*6
	Character(LEN = 12) :: DayTimeConcat*20

	call date_and_time(DateINFO, TImeINFO)

	Year = DateINFO(1:4)
	Month = DateINFO(5:6)
	Day = DateINFO(7:8)

	Hour = TImeINFO(1:2)
	Minute = TimeINFO(3:4)
	Second = TimeINFO(5:10)

	PrettyDate = Month // '-' // Day // '-' // Year
	PrettyTime = Hour // ':' // Minute

	DayTimeConcat = PrettyDate // ', ' // PrettyTime

	call StripSpaces(DayTimeConcat)

	WRITE (*,*) DayTimeConcat

	end subroutine time





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

	end subroutine StripSpaces
