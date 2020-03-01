;;;; To propperly use this program a function must be entered in the following form from the command line
;;;; Ex: (palendromep '(a b b a)) 

(defun palendromep( aList )
(setq f (first aList))
(setq l (first (last aList)))
(cond
	( (equal nil aList) (print t) )
	( (= 1 (length aList)) (print t) )
	( (equal f l)
		(setq a2 (cdr aList)) 
		(setq a3 (reverse (cdr (reverse a2 ))))  
		(palendromep a3) )
	( (= 0 0) (princ nil))
	)
)

(defun main()
(setq pal "PALENDROMEP")
(print "format: (palendromep '<desiredList>)")
(print "Enter function: ")
(setq read (read))
(setq aList (first (last (first (last read)))))
(setq z (first read))
(setq fx (string z))
(cond 
	((equal pal fx) (palendromep aList))
	((= 0 0) (print "invalid function")))
)

(main)
