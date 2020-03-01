	program format5
	implicit none
	
	integer ::  value, lu, lo, li, p
	integer :: luC, loC, liC, pC
	integer :: lenS

	character(LEN = 1) :: space
	character(LEN = 2) :: sPar1, sPar2, sCom
	character(LEN = 6) :: formatF2
	character(LEN = 7) :: sLo, sLu, sLi, sP
	character(LEN = 8) :: sLoS, sLuS, sLiS, sPS
	character(LEN=9) :: formatF
	character(LEN = 10) :: tLu, tLo, tLi, tP
	character(LEN = 26) :: formatF3
	character(LEN = 40) :: concat
	
	!character(LEN = lenS) :: tTest

	formatF = "(i1, a)"
	formatF2 = "(a1)"
	formatF3 = "(aT11, aT22, aT33, aT44)"

	lu = 30
	lo = 15
	li = 5
	p = 1

	luC = 0
	loC = 0
	liC = 0
	pC = 0

	sLu = ' Lunker'
	sLuS = ' Lunkers'
	sLo = ' Looner'
	sLoS = ' Looners'
	sLi = ' Little'
	sLiS = ' Littles'
	sP = ' Pooney'
	sPS = ' Poonies'

	space = ""
	sPar1 = '"('
	sPar2 = ')"'
	sCom = ', '
	
	luC = 1
	loC = 0
	liC = 3
	pC = 4
	
	if(luC == 1) then
		WRITE(*, formatF, advance = 'no') luC, sLu
	else if(luC > 0) then
		WRITE(*, formatF, advance = 'no') luC, sLus
	else
		WRITE(*, formatF2, advance = 'no') space
	end if
	
	if(loC == 1) then
		WRITE(*, formatF, advance = 'no') loC, sLo
	else if(loC > 0) then
		WRITE(*, formatF, advance = 'no') loC, sLos
	else
		WRITE(*, formatF2, advance = 'no') space
	end if
	
	if(liC == 1) then
		WRITE(*, formatF, advance = 'no') liC, sLi
	else if(liC > 0) then
		WRITE(*, formatF, advance = 'no') liC, sLis
	else
		WRITE(*, formatF2, advance = 'no') space
	end if
	
	WRITE(*,*)
	
	end program format5
	
	
	
	