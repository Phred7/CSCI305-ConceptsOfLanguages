	program demo
	implicit none

	integer :: i=1, j=2, k=3
	
	print *," i =", i, " j =", j, "k =", k
	print "(3i8)", i, j, k
	print 100, i, j, k
100	format(3i4) !3 collumns, all integers, 4 spaces in between


	end program demo
