#lang planet neil/sicp
;Exercise 2.18

(define (reverse xs)
  (define (rev-iter in out)
    (if (null? in)
        out
        (rev-iter (cdr in) (cons (car in) out))))
    (rev-iter (cdr xs) (list (car xs))))

(reverse (list 1 4 9 16 25))
;(25 16 9 4 1)