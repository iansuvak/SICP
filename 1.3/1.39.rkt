#lang planet neil/sicp
;Exercise 1.39

(define (cont-frac n d k)
  (define (iter depth result)
    (if (< depth 1)
        result
        (iter (- depth 1) (/ (n depth) (- (d depth) result)))))
  (iter k 0))

(define (square x) (* x x))
(define (d x) (- (* 2 x) 1))
(define (n depth x) (if (= depth 1) x (square x)))

(define (tan-cf x k)
  (cont-frac 
   (lambda (y) (n y x))
   d
   k))
   
   