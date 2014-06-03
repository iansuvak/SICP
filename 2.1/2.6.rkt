#lang planet neil/sicp
;Exercise 4.6
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one-fake (add-1 zero))
(define two-fake (add-1 one-fake))

(define one 
  (lambda (f) (lambda (x) (f x))))
(define two
  (lambda (f) (lambda (x) (f (f x)))))



(define (succ x) (+ x 1))

((one succ) 1) ; same results as fake ones
((two succ) 3) ; same results as fake two =)

(define (church-add a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))

(((church-add two two) succ) 2) ; 6 works as expected 