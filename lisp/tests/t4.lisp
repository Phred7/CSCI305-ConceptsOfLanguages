(defun t4 ()
(setq x '(A B B A))
(setq y (first x))
(setq z (first (last x)))
(print x)
(print y)
(print z)
(setq x2 (cdr x))
(setq x3 (reverse (cdr (reverse x2))))
(setq x4 '())

(cond 
	((equal nil x4) (terpri) (print t) (terpri))
	((equal y z) () (print "equal")))
(print x3)
(print x4)
)


(t4)

