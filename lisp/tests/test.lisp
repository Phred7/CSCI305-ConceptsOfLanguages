(defun AreaOfCircle()
(terpri)
(princ "Enter radius: ")
(setq radius (read))
(setq area (* 3.1415926 radius radius))
(princ "Area: " )
(write area))


(AreaOfCircle)
