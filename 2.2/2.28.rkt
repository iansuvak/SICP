#lang planet neil/sicp
;Exercise 2.28
(define x (list (list 1 2) (list 3 4)))

; got to this more experimentally than anything but it works
(define (fringe ls)
  (define (fringe-iter in out)
    (cond ((null? in) out)
          ((pair? (car in)) (fringe-iter (cdr in) (append (fringe-iter (car in) nil) out )))
          (else (fringe-iter (cdr in) (append (list (car in)) out)))))
  (reverse (fringe-iter ls nil)))
          
;testing
(fringe x)
;(1 2 3 4)

(fringe (list x x))
;(1 2 3 4 1 2 3 4)

