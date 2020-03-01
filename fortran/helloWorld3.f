	program helloWorld3
	implicit none
	character*32 text

*	passes variable text into the subroutine hello

	text = 'Hello World'

	call hello(text)

	end

	subroutine hello(string)
	implicit none
	character*32 string

	write (*,*) string 

	end
	
