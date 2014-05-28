#lang planet neil/sicp
;Exercise 1.43

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter c result)
    (if (<= c 1) result
        (iter (- c 1) (compose f result))))
    (iter n f))

(define (square x) (* x x))
((repeated square 2) 5) ; 625
