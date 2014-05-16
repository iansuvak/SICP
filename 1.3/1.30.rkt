#lang planet neil/sicp

;Exercise 1.30

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

; Below is to check work

(define (cube x) (* x x x))

(define (identity x) x)
(define (inc n) (+ n 1))

(define (sum-integers a b)
  (sum identity a inc b))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))
(integral cube 0 1 0.01)
;.24998750000000042
(integral cube 0 1 0.001)
;.249999875000001
(sum-integers 1 10000)
