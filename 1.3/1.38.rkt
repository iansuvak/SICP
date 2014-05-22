#lang planet neil/sicp
;Exercise 1.38
; N(i) = 1
; D(i) = 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8,

(define (n x) 1)
(define (d x) 
  (if (= (remainder x 3) 2) 
      ( * 2 (ceiling (/ x 3)))
        1))

(define (cont-frac n d k)
  (define (iter depth result)
    (if (< depth 1)
        result
        (iter (- depth 1) (/ (n depth) (+ (d depth) result)))))
  (iter k 0))

(define (e k) (+ 2(cont-frac n d k)))