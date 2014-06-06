#lang planet neil/sicp
;Exercise 2.27
(define (deep-reverse xs)
  (define (rev-iter in out)
    (cond ((null? in) out)
          ((pair? (car in)) (rev-iter (cdr in) (cons (reverse (car in)) out)))
          (else (rev-iter (cdr in) (cons (car in) out)))))
    (rev-iter xs nil))

(define x (list (list 1 2) (list 3 4)))

(deep-reverse x)
;((4 3) (2 1))