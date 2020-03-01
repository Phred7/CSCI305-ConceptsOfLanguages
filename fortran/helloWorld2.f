	program helloWorld2
	implicit none

*	calls hello subroutine

	call hello
	call hello
	call hello

	end

	subroutine hello
	implicit none
	character*32 text

	text = 'Hello World'
	write(*,*) text

	end
