	program main3
	implicit none
	
	integer :: valueIn
	
	valueIn = 0

	call time
	call getInput(valueIn)
	call convert(valueIn)

	end program main3
	
	
	
	

	subroutine getInput(input)
	implicit none
	
	integer :: number, input, ReadStatus
	
	write (*, '( "Input integer: " )', advance="no" )
	ReadInt: do
		read (*, *, iostat=ReadStatus) number
		if ((ReadStatus == 0)) then
			if((number > 0) .AND. (number < 100)) then
				input = number
				exit ReadInt
			else
				write (*, '(/ "INTEGER ERROR: Input must be [1, 99]:" )')
			end if
		else
			write (*, '( / "READ ERROR: please re-input:" )')
		end if
	end do ReadInt

	write (*, '( / "Value read: ", I0 )' ) number
	
	end subroutine getInput
	
	
	
	
	
	
	subroutine userInput(valueIn)
	implicit none

	integer:: input, valueIn

	Read (*,*) input

	valueIn = input

	end subroutine userInput
	





	subroutine convert(valueIn)
	implicit none
	
	integer :: valueIn
	integer :: luC, loC, liC, pC
	integer :: lu, lo, li, p

	character(LEN = 2) :: sPar1, sPar2, sCom
	character(LEN = 7) :: sLu, sLi, sP
	character(LEN = 8) :: sLo, sLuS, sLiS, sPS
	character(LEN = 9) :: sLoS

	lu = 30
	lo = 15
	li = 5
	p = 1

	sLu = ' Lunker '
	sLuS = ' Lunkers '
	sLo = ' Loonter '
	sLoS = ' Loonters '
	sLi = ' Little '
	sLiS = ' Littles '
	sP = ' Pooney '
	sPS = ' Poonies '

	call numCoins(valueIn, lu, luC)
	call numCoins(valueIn, lo, loC)
	call numCoins(valueIn, li, liC)
	call numCoins(valueIn, p, pC)
	
	call writeOut(luC, sLu, sLuS)
	call writeOut(loC, sLo, sLoS)
	call writeOut(liC, sLi, sLiS)
	call writeOut(pC, sP, sPS)
	
	WRITE(*,*)

	end subroutine convert
	
	
	
	
	subroutine writeOut(curCount, stringOut, stringOut2)
	implicit none
	
	integer :: curCount
	
	character(LEN = 1) :: space
	character(LEN = 11) :: formatF
	character(Len = *) :: stringOut, stringOut2
	
	formatF = "(i1, a, a1)"
	
	space = ""
	
	if(curCount == 1) then
		WRITE(*, formatF, advance = 'no') curCount, stringOut, space
	else if(curCount > 0) then
		WRITE(*, formatF, advance = 'no') curCount, stringOut2, space
	end if
	
	end subroutine writeOut
	


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
