	program format4
	implicit none
	
	integer ::  value, lu, lo, li, p
	integer :: luC, loC, liC, pC
	integer :: lenS

	character(LEN = 1) :: space
	character(LEN = 2) :: sPar1, sPar2, sCom
	character(LEN = 6) :: formatF2
	character(LEN = 6) :: sLo, sLu, sLi, sP
	character(LEN = 7) :: sLoS, sLuS, sLiS, sPS
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
		WRITE(tLu, formatF) luC, sLu
	else if (luC > 1) then
		WRITE(tLu, formatF) luC, sLuS
	else
		WRITE(tLu, formatF2) space
	end if
	
	if(loC == 1) then
		WRITE(tLo, formatF) loC, sLo
	else if (loC > 1) then
		WRITE(tLo, formatF) loC, sLoS
	else
		lenS = 1
		WRITE(tLo, formatF2) space
	end if
	
	if(liC == 1) then
		WRITE(tLi, formatF) liC, sLi
	else if (liC > 1) then
		WRITE(tLi, formatF) liC, sLiS
	else
		WRITE(tLi, formatF2) space
	end if
	
	if(pC == 1) then
		WRITE(tP, formatF) pC, sP
	else if (pC > 1) then
		WRITE(tP, formatF) pC, sPS
	else
		WRITE(tP, formatF2) space
	end if
	
	concat = tLu // tLo // tLi // tP
	!concat = tLu // tTest // tLi // tP
		
	WRITE(*,*) concat // ','
	
	end program format4
	
	
	
	