#lang planet neil/sicp

;Exercise 1.32

;(accumulate combiner null-value term a next b)

;recursive
(define (accumulate-r combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate-r combiner null-value term (next a) next b))))

;iterative
(define (accumulate-i combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))
; use iterative
(define (accumulate combiner null-value term a next b)
  (accumulate-i combiner null-value term a next b))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (identity n) n)
(define (inc x) (+ x 1))