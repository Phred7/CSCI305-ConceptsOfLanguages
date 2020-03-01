	program main
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

	end program main





	subroutine convert(value)
	implicit none

	integer value, lunker, looner, little, p
	integer lunkerCount, loonerCount, littleCount, pCount
	integer i

	character(LEN = 30) :: luString, loString, liString, pString
	character(LEN = 150) :: stringCombo

	i = 1

	lunker = 30
	looner = 15
	little = 5
	p = 1

	lunkerCount = 0
	loonerCount = 0
	littleCount = 0
	pCount = 0

	do while (i <= 4)
		if (i == 1) then
			i = 2
			call numCoins(value, 30, lunkerCount)
			if (lunkerCount > 0) then
				if(lunkerCount == 1) then
					luString = '1_Lunker'
				else
					luString = '_Lunkers'
					call int2String(lunkerCount, luString)
					call StripSpaces(luString)
				end if
				WRITE (*,*) luString
				call StripSpaces(luString)
			end if
		else if (i == 2) then
			i = 3
			call numCoins(value, 15, loonerCount)
			if (loonerCount > 0) then
				if(loonerCount == 1) then
					loString = '1_Looner'
				else
					WRITE (*,*) '-~-~-~- error -~-~-~-'
				end if
				WRITE (*,*) loString
			end if
		else if (i == 3) then
			i = 4
			call numCoins(value, 5, littleCount)
			if (littleCount > 0) then
				if(littleCount == 1) then
					liString = '1_Little'
				else
					liString = '_Littles'
					call int2String(littleCount, liString)
					call StripSpaces(liString)
				end if
				WRITE (*,*) liString
			end if
		else if (i == 4) then
			i = 1999
			call numCoins(value, 1, pCount)
			if (pCount > 0) then
				if(pCount == 1) then
					pString = '1_Pooney'
				else
					pString = '_Poonies'
					call int2String (pCount, pString)
					call StripSpaces (pString)
				end if
				WRITE (*,*) pString
			end if
		else
			write (*,*) 'i not in bounds - error - i: ', i
		end if
	end do

	call StripSpaces(luString)
	luString = luString
	call StripSpaces(loString)
	loString = loString

	stringCombo = luString // ',_' //loString
	WRITE (*,*) stringCombo

	stringCombo = luString // loString // liString // pString
	WRITE (*,*) stringCombo
	
	if (lunkerCount == 0) then	
		
	else if (loonerCount == 0) then

	else if (littleCount == 0) then

	else if (pooneyCount == 0) then

	else

	end if

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
