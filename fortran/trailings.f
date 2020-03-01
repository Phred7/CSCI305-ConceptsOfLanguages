	program trailings
	implicit none

	character (LEN = 12) :: a, b, a2, b2
	character(LEN = 45) :: stringy, stringy2

	a = ' 1 string '
	b = ' 2 strings '

	stringy = a // b

	write(*,*) a , '-', b
	write(*,*) 'these', stringy, '-'
	write(*,*) 'these', trim(adjustl(stringy)), '-'

	write(a2,*) trim(adjustl(a))
	write(b2,*) trim(adjustl(b))	

	write(*,*) a, '-'
	write(*,*) b, '-'
	write(*,*) a2, '-'
	write(*,*) b2, '-'
	write(*,*) trim(adjustl(a2)), '-'
	write(*,*) trim(adjustl(b2)), '-'

	stringy2 = a2 // ', ' // b2
	
	write(*,*) 'these', stringy, '-'
	
	write(*,*) a, '-'
	write(*,*) a2, '-'

	end program trailings





	subroutine remove(string1, string2)
	implicit none

	character*256 string1, string2
	integer*4 i, ls1, ls2

	ls1 = len_trim(string1)
	ls2 = 0

	do i = 1, ls1
		if(string1(i:i).ne.' ') then
			ls2 = ls2 + 1
			string2(ls2:ls2) = string1(i:i)
		end if
	end do

	end subroutine remove

	



	subroutine removeDo(string1, string2)
	implicit none

	integer*2 :: whileBool 
	integer :: stringLen, indexer, indexLast, tempLen
	character(len=*) :: string1, string2	

	stringLen = len(string1)
	tempLen = stringLen

	indexer = 1
	indexLast = 1
	whileBool = 1

	do while (indexer < stringLen)
		indexLast = indexer
		indexer = indexer + 1
		if((string1(indexer:indexer) == ' ') then
			do while (!string is not another character)
				!index the nested do while until something else os found
				!then exti the loop
				!then if the nested only went through once, only one space then leave it alone
				!if it was more than once then remove all the chars bewteen a and b by writing no spaces to the new string
				! and remember to update tempLen


	end subroutine removeDo
