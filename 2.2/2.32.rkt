#lang planet neil/sicp
;Exercise 2.32

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

; this works because the inner lambda takes the first element of the set and appends it to all of the subsets (excluding the original set of course) and this keeps 
;propagating down to the empty list  being the bottom subset


  
(subsets (list 1 2 3))
  
  
